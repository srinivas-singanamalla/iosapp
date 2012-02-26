//
//  Stop.h
//  PumperApp
//
//  Created by Srinivas Singanamalla on 2/9/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Stop : NSManagedObject

- (NSString*) getName;

- (NSString*) getLatitude;

- (NSString*) getLongitude;

- (NSString*) getStopId;

- (NSString*) getDescription;



@end

@protocol StopList <NSObject>

- (Stop*) getStopDetails: (NSInteger) index;

- (Stop*) getStopDetailsBy:(NSInteger) stopId;

@end
