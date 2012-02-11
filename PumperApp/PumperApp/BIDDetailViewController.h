//
//  BIDDetailViewController.h
//  PumperApp
//
//  Created by Srinivas Singanamalla on 2/3/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BIDDetailViewController : UIViewController <UISplitViewControllerDelegate>
@property (strong, nonatomic) IBOutlet UILabel *stopId;
@property (strong, nonatomic) IBOutlet UILabel *stopName;

@property (strong, nonatomic) IBOutlet UILabel *stopDescription;
@property (strong, nonatomic) id detailItem;
@property (strong, nonatomic) IBOutlet UILabel *longitude;

@property (strong, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@property (strong, nonatomic) IBOutlet UILabel *latitude;

@property (strong, nonatomic) IBOutlet UILabel *dataLabel;
@property (strong, nonatomic) id equipmentDetails;

@property (strong, nonatomic) id stopDetails;


@end
