//
//  Un2ViewController.m
//  Un2
//
//  Created by Broken Rim on 6/24/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Un2ViewController.h"

@implementation Un2ViewController
@synthesize aView;

- (void)dealloc
{
    [aView release];
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.view addSubview:aView];
}

- (void)viewDidUnload
{
    [self setAView:nil];
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
