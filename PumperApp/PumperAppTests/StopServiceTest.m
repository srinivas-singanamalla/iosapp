//
//  StopServiceTest.m
//  PumperApp
//
//  Created by Srinivas Singanamalla on 2/23/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "StopServiceTest.h"
#import "StopService.h"

@implementation StopServiceTest

// All code under test must be linked into the Unit Test bundle
- (void)testMath
{
    STAssertTrue((1 + 1) == 2, @"Compiler isn't feeling well today :-(");
}

- (void) testGetStopDetails {
    
    StopService* stopService = [[StopService alloc] init];
    //[stopService setDelegate:self];
    //[stopService start];
    
}

- (void) testGetStopDetailAtIndex {
    
    
}

- (void) testGetStopsCount {
    
}

- (void) testDownloadStopInfo {
    
}

- (void) testUploadStopIndo {
    
}

@end
