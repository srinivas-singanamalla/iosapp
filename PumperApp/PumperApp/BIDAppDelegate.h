//
//  BIDAppDelegate.h
//  PumperApp
//
//  Created by Srinivas Singanamalla on 2/3/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
@class UIPageViewController;

@interface BIDAppDelegate : UIResponder <UIApplicationDelegate, UIPageViewControllerDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

//its a hack
- (UIPageViewController*) getUIPageViewController;
- (void) setFirstPageOf:(UIPageViewController*)pageViewController withStoryBoard: (UIStoryboard*)storyboard;

@end
