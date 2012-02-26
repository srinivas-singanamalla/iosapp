//
//  PumperAppTests.m
//  PumperAppTests
//
//  Created by Srinivas Singanamalla on 2/3/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "PumperAppTests.h"
#import "StopService.h"

@implementation PumperAppTests

- (void)setUp
{
    [super setUp];
    
    // Set-up code here.
}

- (void)tearDown
{
    // Tear-down code here.    
    [super tearDown];
}

- (void)testStopService
{ 
    StopService* stopService = [[StopService alloc] init];
    NSData* data = [stopService fetchUrlData];    
    STAssertNotNil(data, @"Data from server is Nil");
    
    NSError *jsonParsingError = nil;
    NSObject *jsonObj = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonParsingError];
    
    STAssertTrue([NSJSONSerialization isValidJSONObject:jsonObj], @"data is Not a valid Json Object");
}


- (void) testStopUrl {        
    
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
    [NSURLConnection sendAsynchronousRequest:theRequest queue:queue 
                           completionHandler:^(NSURLResponse *response, 
                                               NSData *data, NSError *error) {
        STAssertNotNil(data, @"Data from server should not be Nil");                       
        if ([data length] > 0 && error == nil) {
            NSString *html = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
            NSLog(@"HTML = %@", html); 
            
            NSError *jsonParsingError = nil;
            NSObject *jsonObj = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonParsingError];
            NSLog([jsonObj description], nil);
            
            STAssertTrue([NSJSONSerialization isValidJSONObject:jsonObj], @"data is Not a valid Json Object");
        } 
        }];
}

- (void) testUploadStopUrl {
    NSData* dictionaryOrArrayToOutput = nil;
    NSError *error; 
    /*
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dictionaryOrArrayToOutput options:NSJSONWritingPrettyPrinted error:&error];
    
    if (! jsonData) {
        NSLog(@"Got an error: %@", error);
    } else {
        NSString *jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    }*/
    
}
@end
