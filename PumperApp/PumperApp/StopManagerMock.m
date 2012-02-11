//
//  StopManagerMock.m
//  PumperApp
//
//  Created by Srinivas Singanamalla on 2/4/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "StopManagerMock.h"
#import "Stop.h"


@implementation StopManagerMock

- (Stop*) getStopDetailsBy:(NSInteger)stopId {
    for (int index = 0; index < 8; index ++) {
        Stop* stop = [self getStopDetails:index];
        if (stop.stopId == stopId) {
            return stop;
        }
    }
    
    return [self getStopDetails:0];
}

- (Stop*) getStopDetails: (NSInteger) index {
    
    if (index > 7) {
        return nil;
    }
    
    Stop* stop = [[Stop alloc] init];
    
    if (index == 0) {
        stop.stopId = 1234;
        stop.name = @"Stop A";
        stop.latitude = 23.56;
        stop.longitude = 67.65;
        stop.latlong = @"23 56' 78\", 45 89' 80\"";
        stop.desc = @"Stop Description A";
    } else if (index == 1) {
        stop.stopId = 1235;
        stop.name = @"Stop B";
        stop.latitude = 223.26;
        stop.longitude = 637.65;
        stop.latlong = @"23 56' 78\", 45 89' 80\"";
        stop.desc = @"Stop Description B";        
    } else if (index == 2) {
        stop.stopId = 1236;
        stop.name = @"Stop C";
        stop.latitude = 233.56;
        stop.longitude = 657.65;
        stop.latlong = @"23 56' 78\", 45 89' 80\"";
        stop.desc = @"Stop Description C";        
    } else if (index == 3) {
        stop.stopId = 1237;
        stop.name = @"Stop D";
        stop.latitude = 3.56;
        stop.longitude = 10.65;
        stop.latlong = @"23 56' 78\", 45 89' 80\"";
        stop.desc = @"Stop Description D";        
    } else if (index == 4) {
        stop.stopId = 1238;
        stop.name = @"Stop E";
        stop.latitude = 223.56;
        stop.longitude = 667.65;
        stop.latlong = @"23 56' 78\", 45 89' 80\"";
        stop.desc = @"Stop Description E";        
    } else if (index == 5) {
        stop.stopId = 1239;
        stop.name = @"Stop F";
        stop.latitude = 210.56;
        stop.longitude = 627.65;
        stop.latlong = @"23 56' 78\", 45 89' 80\"";
        stop.desc = @"Stop Description F";        
    } else if (index == 6) {
        stop.stopId = 1240;
        stop.name = @"Stop G";
        stop.latitude = 223.56;
        stop.longitude = 657.85;
        stop.latlong = @"23 56' 78\", 45 89' 80\"";
        stop.desc = @"Stop Description G";        
    } else if (index == 7) {
        stop.stopId = 1241;
        stop.name = @"Stop H";
        stop.latitude = 90.56;
        stop.longitude = 10.00;
        stop.desc = @"Stop Description H";        
        stop.latlong = @"23 56' 78\", 45 89' 80\"";
    } else {
        NSLog([NSString stringWithFormat:@"Stop counter: %d not supported.", index], nil);
    }
    
    return stop;
}

static StopManagerMock* stopManagerSingleton = nil;

+ (StopManagerMock*) getStopManager {
    @synchronized(self) {
        if (stopManagerSingleton == nil) {
            stopManagerSingleton = [[StopManagerMock alloc] init];
        }
    }
    return stopManagerSingleton;
}

@end
