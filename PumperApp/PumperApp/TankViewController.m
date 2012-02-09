//
//  TankViewController.m
//  PumperApp
//
//  Created by Srinivas Singanamalla on 2/7/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "TankViewController.h"

@implementation TankViewController
@synthesize topFrom;
@synthesize topTo;
@synthesize bottomFrom;
@synthesize bottomTo;
@synthesize useCalcFrom;
@synthesize useCalcTo;
@synthesize purchaseNumber;
@synthesize stock;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView
{
}
*/

/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
}
*/

- (void)viewDidUnload
{
    [self setTopFrom:nil];
    [self setTopTo:nil];
    [self setBottomFrom:nil];
    [self setBottomTo:nil];
    [self setUseCalcFrom:nil];
    [self setUseCalcTo:nil];
    [self setPurchaseNumber:nil];
    [self setStock:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
	return YES;
}

@end
