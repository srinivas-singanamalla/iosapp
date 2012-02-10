//
//  Stop.h
//  PumperApp
//
//  Created by Srinivas Singanamalla on 2/9/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Stop : NSObject {
@private
    NSInteger stopId;
    NSString* name;
    float latitude;
    float longitude;
    NSString* latlong;
    NSString* desc;
}

@property (nonatomic) NSInteger stopId;
@property (strong, nonatomic) NSString* name;
@property (nonatomic) float latitude;
@property (nonatomic) float longitude;
@property (strong, nonatomic) NSString* desc;
@property (strong, nonatomic) NSString* latlong;

@end

@protocol StopList <NSObject>

- (Stop*) getStopDetails: (NSInteger) index;

@end
