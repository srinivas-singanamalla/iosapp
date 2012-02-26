//
//  StopService.h
//  PumperApp
//
//  Created by Srinivas Singanamalla on 2/19/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SQLBIService.h"
#import "StopServiceDataDelegate.h"

@class StopDAO, Stop;

@interface StopService : SQLBIService

@property (strong, nonatomic) NSMutableData* webData;

@property (strong, nonatomic) StopDAO* stopDAO;

@property (weak, nonatomic) id<StopServiceDataDelegate> serviceDataDelegate;

- (Stop*) getStopAt: (NSInteger) index;

- (Stop*) getStop:(NSInteger) stopId;

- (NSArray*) getAllStops;

@end
