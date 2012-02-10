//
//  GasMeterViewController.h
//  PumperApp
//
//  Created by Srinivas Singanamalla on 2/7/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BIDDetailViewController.h"

@interface GasMeterViewController : BIDDetailViewController

@property (strong, nonatomic) IBOutlet UITextField *linePressure;
@property (strong, nonatomic) IBOutlet UITextField *differential;
@property (strong, nonatomic) IBOutlet UITextField *temperature;

@end
