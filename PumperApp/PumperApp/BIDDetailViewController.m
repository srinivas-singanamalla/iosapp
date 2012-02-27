//
//  BIDDetailViewController.m
//  PumperApp
//
//  Created by Srinivas Singanamalla on 2/3/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "BIDDetailViewController.h"
#import "Stop.h"

@interface BIDDetailViewController ()
@property (strong, nonatomic) UIPopoverController *masterPopoverController;
- (void)configureView;
@end

@implementation BIDDetailViewController

@synthesize stopId = _stopId;
@synthesize stopName = _stopName;
@synthesize stopDescription = _stopDescription;
@synthesize detailItem = _detailItem;
@synthesize longitude = _longitude;
@synthesize detailDescriptionLabel = _detailDescriptionLabel;
@synthesize latitude = _latitude;
@synthesize masterPopoverController = _masterPopoverController;
@synthesize dataLabel = _dataLabel;
@synthesize equipmentDetails = _equipmentDetails;
@synthesize stopDetails = _stopDetails;

     
#pragma mark - Managing the detail item 

- (void)setDetailItem:(id)newDetailItem
{
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
        
        // Update the view.
        [self configureView];
    }

    if (self.masterPopoverController != nil) {
        [self.masterPopoverController dismissPopoverAnimated:YES];
    }        
}

- (void)configureView
{
    // Update the user interface for the detail item.

    if (self.detailItem) {
        self.detailDescriptionLabel.text = [self.detailItem description];
        Stop* stop = (Stop*) _detailItem;
        self.stopId.text = [NSString stringWithFormat:@"%d", [(NSNumber*)[stop valueForKey:@"stopId"] intValue]];
        self.stopName.text = [stop valueForKey:@"name"];
        self.longitude.text = [stop valueForKey:@"longitude"];
        self.stopDescription.text = [stop valueForKey:@"desc"];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self configureView];
}

- (void)viewDidUnload
{
    [self setStopId:nil];
    [self setStopName:nil];
    [self setStopDescription:nil];
    [self setLongitude:nil];
    [self setLatitude:nil];
    [self setStopDetails:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    self.dataLabel.text = [self.equipmentDetails description];
    
    Stop* stopDetails = (Stop*)self.stopDetails;
/*
    self.stopId.text = [NSString stringWithFormat:@"%d", stopDetails.stopId];
    self.stopName.text = stopDetails.name;
    self.stopDescription.text = stopDetails.desc;
    self.longitude.text = stopDetails.latlong;
*/
    //[self setStopName:self.dataObject.stopName];
     
     

}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return YES;
}

#pragma mark - Split view

- (void)splitViewController:(UISplitViewController *)splitController willHideViewController:(UIViewController *)viewController withBarButtonItem:(UIBarButtonItem *)barButtonItem forPopoverController:(UIPopoverController *)popoverController
{
    barButtonItem.title = NSLocalizedString(@"Master", @"Master");
    [self.navigationItem setLeftBarButtonItem:barButtonItem animated:YES];
    self.masterPopoverController = popoverController;
}

- (void)splitViewController:(UISplitViewController *)splitController willShowViewController:(UIViewController *)viewController invalidatingBarButtonItem:(UIBarButtonItem *)barButtonItem
{
    // Called when the view is shown again in the split view, invalidating the button and popover controller.
    [self.navigationItem setLeftBarButtonItem:nil animated:YES];
    self.masterPopoverController = nil;
}

@end
