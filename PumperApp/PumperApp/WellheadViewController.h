//
//  WellheadViewController.h
//  PumperApp
//
//  Created by Srinivas Singanamalla on 2/7/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BIDDetailViewController.h"

@interface WellheadViewController : BIDDetailViewController
@property (strong, nonatomic) IBOutlet UITextField *tubingPressure;
@property (strong, nonatomic) IBOutlet UITextField *casingPressure;
@property (strong, nonatomic) IBOutlet UITextField *chokeSize;

@property (strong, nonatomic) IBOutlet UITextField *dailyProducingStatus;
@property (strong, nonatomic) IBOutlet UITextView *comments;
@property (strong, nonatomic) IBOutlet UITextField *downtimeUnits;
@end
