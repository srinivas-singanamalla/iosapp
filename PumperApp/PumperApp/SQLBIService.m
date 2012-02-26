//
//  SQLBIService.m
//  PumperApp
//
//  Created by Srinivas Singanamalla on 2/24/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "SQLBIService.h"


@implementation SQLBIService


@synthesize serviceDelegate = _serviceDelegate;

- (void) start {
    [_serviceDelegate serviceDidStart];
    [self run];
    
}

- (void) run {
    [NSException raise:@"Subclass shoule implement the run method" format:@"Run method not implemented"];
}


@end
