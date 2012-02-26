//
//  StopService.m
//  PumperApp
//
//  Created by Srinivas Singanamalla on 2/19/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "StopService.h"
#import "Stop.h"
#import "StopDAO.h"

#import "NSManagedObject+Additions.h"

#import "BIDAppDelegate.h"

@interface StopService()

- (void) downloadStopData;

@end

@implementation StopService

@synthesize webData = _webData;
@synthesize stopDAO = _stopDAO;
@synthesize serviceDataDelegate = _serviceDataDelegate;  

- (id) init {
    self = [super init];
    if (self != nil) {
        _stopDAO = [[StopDAO alloc] init]; 
        _serviceDataDelegate = _stopDAO;
    }
    return self;
}

- (void) run {
    
    //if data is not downloaded
    [self downloadStopData];
    
    //if data is downloaded
    //[self runComplete];
    
    //[self.serviceDelegate serviceDidComplete:(NSData *)data error:(NSError *)error];
    //[self.serviceDelegate serviceDidComplete];
}

- (void) downloadStopData {
    
    NSString* soapMessage = [NSString string];
    NSURL *url = [NSURL URLWithString:@"http://pumperapp.appspot.com/pumperapp/getStopDetails.do"];
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: msgLength forHTTPHeaderField:@"Content-Length"];
    [theRequest setHTTPMethod:@"GET"];
    [theRequest setTimeoutInterval:30.0f];
    [theRequest setHTTPBody: [soapMessage dataUsingEncoding:NSUTF8StringEncoding]];
    
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    StopService* this = self;
    [NSURLConnection sendAsynchronousRequest:theRequest queue:queue 
                           completionHandler:^(NSURLResponse *response, 
                                               NSData *data, NSError *error) {
                               
                               if ([data length] > 0 && error == nil) {
                                   NSString *html = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
                                   NSLog(@"HTML = %@", html); 
                                   
                                   NSError *jsonParsingError = nil;
                                   NSObject *jsonObj = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonParsingError];
                                   NSLog([jsonObj description], nil);  
                                                                      
                                                                      
                                   if ([jsonObj isKindOfClass:[NSArray class]]) {
                                       NSArray* stopsArray = (NSArray*)jsonObj;
                                       
                                       [_serviceDataDelegate handleArrayData:stopsArray];
                                       [self.serviceDelegate service:this didComplete:@"StopService Completing" error:error];
                                   }
                                   
                               } 
                           }];
}

- (Stop*) getStop:(NSInteger) stopId {
    return (Stop*)[self.stopDAO getStop:stopId];
}

- (Stop*) getStopAt: (NSInteger) index {
    return (Stop*)[self.stopDAO getStop:index];
}

- (NSArray*) getAllStops {
    return [self.stopDAO getAllStops];
}


@end
