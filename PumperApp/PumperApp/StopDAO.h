//
//  StopDAO.h
//  PumperApp
//
//  Created by Srinivas Singanamalla on 2/23/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "StopServiceDataDelegate.h"
@class Stop;

@interface StopDAO : NSObject<StopServiceDataDelegate>

@property (weak, nonatomic) id<StopServiceDataDelegate>stopDAODelegate;

- (NSManagedObject*) getStop:(NSInteger) stopId;

- (NSManagedObject*) getStopAtIndex:(NSInteger)index;

- (NSArray*) getAllStops;

- (void) deleteAllStops;

@end
