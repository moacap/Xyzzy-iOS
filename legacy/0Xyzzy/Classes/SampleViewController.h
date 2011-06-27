//
//  SampleViewController.h
//  Xyzzy
//
//  Created by Broken Rim on 6/6/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface SampleViewController : UIViewController <UITableViewDataSource, UITableViewDelegate> {

	UITableView *mainTableView;
	NSMutableArray *content_;
}

@property (nonatomic, retain) IBOutlet UITableView *mainTableView;
@property (nonatomic, retain) NSMutableArray *content_;

@end
