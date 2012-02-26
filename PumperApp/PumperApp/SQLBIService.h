//
//  SQLBIService.h
//  PumperApp
//
//  Created by Srinivas Singanamalla on 2/24/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SQLBIServiceDelegate.h"

@interface SQLBIService : NSObject {

}

@property (weak, nonatomic) id<SQLBIServiceDelegate> serviceDelegate;

- (void) start;

- (void) run;

@end
