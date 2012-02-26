//
//  SQLBIServiceDelegate.h
//  PumperApp
//
//  Created by Srinivas Singanamalla on 2/24/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
@class SQLBIService;

@protocol SQLBIServiceDelegate <NSObject>

- (void) serviceDidStart;

- (void) service:(SQLBIService*)service didComplete:(NSString*)message error:(NSError *)error;

@end 