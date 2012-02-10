//
//  StopManagerMock.h
//  PumperApp
//
//  Created by Srinivas Singanamalla on 2/4/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Stop.h"

@interface StopManagerMock : NSObject<StopList>

+ (StopManagerMock*) getStopManager;

@end
