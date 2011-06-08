//
//  SampleViewController.m
//  Xyzzy
//
//  Created by Broken Rim on 6/6/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "SampleViewController.h"


@implementation SampleViewController

@synthesize mainTableView;
@synthesize content_;

- (void)dealloc {
	NSLog(@"> Entering %s <", __PRETTY_FUNCTION__ );
	
	[mainTableView release], mainTableView = nil;
	[content_ release], content_ = nil;
	
    [super dealloc];
	
	NSLog(@"> Leaving %s <", __PRETTY_FUNCTION__ );
}

// The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
/*
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization.
    }
    return self;
}
*/

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
	
    [super viewDidLoad];
	
	NSLog(@"Hello, World.");
	NSMutableArray *array = [[NSMutableArray alloc] initWithObjects:@"Red", @"Blue", @"Green", @"A", nil];
	[self setContent_:array];	
	[array release], array = nil;
	NSLog(@"Calling reloadData on %@", self.mainTableView);
	[[self mainTableView] reloadData];
	
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}


- (void):viewWillAppear:(BOOL)animated {

	[super viewWillAppear:animated];
	NSLog(@"Calling reloadData on %@", self.mainTableView);
	[[self mainTableView] reloadData];
}

/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations.
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc. that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

	NSInteger count = [[self content_] count];
	
	return count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

	NSString *contentForThisRow = [[self content_] objectAtIndex:[indexPath row]];
									
	static NSString *CellIdentifier = @"CellIdentifier";
	
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
	if ( cell == nil ) {
		cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
				
	}
	
	[[cell textLabel] setText:contentForThisRow];
	
	return cell;
							 
}


@end
