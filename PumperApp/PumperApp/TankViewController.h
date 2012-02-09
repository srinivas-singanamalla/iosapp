//
//  TankViewController.h
//  PumperApp
//
//  Created by Srinivas Singanamalla on 2/7/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BIDDetailViewController.h"

@interface TankViewController : BIDDetailViewController
@property (strong, nonatomic) IBOutlet UITextField *topFrom;
@property (strong, nonatomic) IBOutlet UITextField *topTo;
@property (strong, nonatomic) IBOutlet UITextField *bottomFrom;
@property (strong, nonatomic) IBOutlet UITextField *bottomTo;
@property (strong, nonatomic) IBOutlet UITextField *useCalcFrom;
@property (strong, nonatomic) IBOutlet UITextField *useCalcTo;
@property (strong, nonatomic) IBOutlet UITextField *purchaseNumber;
@property (strong, nonatomic) IBOutlet UITextField *stock;

@end
