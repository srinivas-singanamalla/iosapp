//
//  BIDModelController.h
//  PageBasedApp
//
//  Created by Srinivas Singanamalla on 2/4/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class BIDDetailViewController;

@interface BIDModelController : NSObject <UIPageViewControllerDataSource>

- (BIDDetailViewController *)viewControllerAtIndex:(NSUInteger)index 
                                        storyboard:(UIStoryboard *)storyboard;
- (NSUInteger)indexOfViewController:(BIDDetailViewController *)viewController;

@end
