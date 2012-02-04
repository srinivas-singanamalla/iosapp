//
//  StopManagerMock.h
//  PumperApp
//
//  Created by Srinivas Singanamalla on 2/4/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Stop : NSObject {
@private
    NSInteger stopId;
    NSString* name;
    float latitude;
    float longitude;
    NSString* desc;
}

@property (nonatomic) NSInteger stopId;
@property (strong, nonatomic) NSString* name;
@property (nonatomic) float latitude;
@property (nonatomic) float longitude;
@property (strong, nonatomic) NSString* desc;

@end



@interface StopManagerMock : NSObject

- (Stop*) getStopDetails: (NSInteger) index;

+ (StopManagerMock*) getStopManager;

@end
