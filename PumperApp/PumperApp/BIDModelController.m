//
//  BIDModelController.m
//  PageBasedApp
//
//  Created by Srinivas Singanamalla on 2/4/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "BIDModelController.h"

#import "BIDDetailViewController.h"
#import "Stop.h"
#import "StopManagerMock.h"

/*
 A controller object that manages a simple model -- a collection of month names.
 
 The controller serves as the data source for the page view controller; it therefore implements pageViewController:viewControllerBeforeViewController: and pageViewController:viewControllerAfterViewController:.
 It also implements a custom method, viewControllerAtIndex: which is useful in the implementation of the data source methods, and in the initial configuration of the application.
 
 There is no need to actually create view controllers for each page in advance -- indeed doing so incurs unnecessary overhead. Given the data model, these methods create, configure, and return a new view controller on demand.
 */

@interface BIDModelController()
@property (readonly, strong, nonatomic) NSArray *pageData;
@property (strong, nonatomic) id<StopList> stopList;
@end

@implementation BIDModelController

@synthesize pageData = _pageData;
@synthesize stopList = _stopList;


- (id)init
{
    self = [super init];
    if (self) {
        // Create the data model.
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        _pageData = [[dateFormatter monthSymbols] copy];
        _stopList = [StopManagerMock getStopManager];
        
    }
    return self;
}

- (BIDDetailViewController *)viewControllerAtIndex:(NSUInteger)index storyboard:(UIStoryboard *)storyboard
{   
    // Return the data view controller for the given index.
    if (([self.pageData count] == 0) || (index >= [self.pageData count])) {
        return nil;
    }
    
    // Create a new view controller and pass suitable data.        
    NSArray* controllerIdentifierArray = [NSArray arrayWithObjects:@"BIDDetailViewController", @"GasMeterViewController", @"TankViewController", @"WellheadViewController", nil];
    
    BIDDetailViewController *dataViewController = [storyboard instantiateViewControllerWithIdentifier: index < 4 ? [controllerIdentifierArray objectAtIndex:index] : @"BIDDetailViewController"];
    
    dataViewController.equipmentDetails = [self.pageData objectAtIndex:index];
    dataViewController.stopDetails = [self.stopList getStopDetails:index];
    return dataViewController;
}

- (NSUInteger)indexOfViewController:(BIDDetailViewController *)viewController
{   
    /*
     Return the index of the given data view controller.
     For simplicity, this implementation uses a static array of model objects and the view controller stores the model object; you can therefore use the model object to identify the index.
     */
    return [self.pageData indexOfObject:viewController.equipmentDetails];
}

#pragma mark - Page View Controller Data Source

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController
{
    NSUInteger index = [self indexOfViewController:(BIDDetailViewController *)viewController];
    if ((index == 0) || (index == NSNotFound)) {
        return nil;
    }
    
    index--;
    return [self viewControllerAtIndex:index storyboard:viewController.storyboard];
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController
{
    NSUInteger index = [self indexOfViewController:(BIDDetailViewController *)viewController];
    if (index == NSNotFound) {
        return nil;
    }
    
    index++;
    if (index == [self.pageData count]) {
        return nil;
    }
    return [self viewControllerAtIndex:index storyboard:viewController.storyboard];
}

@end
