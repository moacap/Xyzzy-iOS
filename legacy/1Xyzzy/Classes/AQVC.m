    //
//  AQVC.m
//  Xyzzy
//
//  Created by Broken Rim on 6/6/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "AQVC.h"


@implementation AQVC

- (NSUInteger) numberOfItemsInGridView: (AQGridView *) aGridView {
	return ( 10 );
}

- (void) viewDidLoad {
	[super viewDidLoad];
	
	self.gridView.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
	self.gridView.autoresizesSubviews = YES;
	self.gridView.resizesCellWidthToFit = NO;
	self.gridView.separatorStyle = AQGridViewCellSeparatorStyleSingleLine;
	

	[self.gridView reloadData];
}

- (BOOL) shouldAutorotateToInterfaceOrientation: (UIInterfaceOrientation) interfaceOrientation
{
    return YES;
}

- (AQGridViewCell *) gridView: (AQGridView *) gridView cellForItemAtIndex: (NSUInteger) index {
	
	AQGridViewCell * cell = nil;
		
	cell = [[AQGridViewCell alloc] initWithFrame: CGRectMake(0.0, 0.0,127, 127)];
	cell.selectionGlowColor = [UIColor purpleColor];
	
	CGFloat padding =  ( ( 256 - 240 ) / 3 );
	//UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 10, 168)];
	//label.text = @"Hello, World";
	//[cell.contentView addSubview:label];
	
	UIImageView *image = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"flower01-320.jpg"]];
	image.frame = CGRectMake( 8, 8, 240.0, 240.0 );
	image.frame = CGRectMake( 2, 2, 124, 124 );
	[cell.contentView addSubview:image];
	return cell;
}

- (CGSize) portraitGridCellSizeForGridView: (AQGridView *) gridView {
	return ( CGSizeMake(128, 128) );
	return ( CGSizeMake(224.0, 168.0) );
    return ( CGSizeMake(320, 320.0) );
}


	// The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
/*
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
        // Custom initialization.
    }
    return self;
}
*/

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/

/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
}
*/

/*
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Overriden to allow any orientation.
    return YES;
}


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

 */

- (void)dealloc {
    [super dealloc];
}


@end
