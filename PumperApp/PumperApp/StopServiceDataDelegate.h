//
//  StopDAODelegate.h
//  PumperApp
//
//  Created by Srinivas Singanamalla on 2/25/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol StopServiceDataDelegate <NSObject>

@optional
- (void) handleArrayData:(NSArray*)objsArray;

@optional
- (void) handleData:(NSDictionary*)obj;

@end
