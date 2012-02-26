//
//  BIDMasterViewController.h
//  PumperApp
//
//  Created by Srinivas Singanamalla on 2/3/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SQLBIServiceDelegate.h"

@class BIDDetailViewController, StopService;

#import <CoreData/CoreData.h>

@interface SQLBIStopListViewController : UITableViewController <NSFetchedResultsControllerDelegate, SQLBIServiceDelegate>

@property (strong, nonatomic) BIDDetailViewController *detailViewController;

@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;

@property (strong, nonatomic) StopService* stopService;

@end
