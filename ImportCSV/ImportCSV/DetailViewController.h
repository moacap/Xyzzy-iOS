//
//  DetailViewController.h
//  ImportCSV
//
//  Created by Broken Rim on 7/13/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "CVSFile.h"

@interface DetailViewController : UITableViewController {
    CVSFile *cvsFile;
    NSMutableArray *lineList;
}

@property (nonatomic,retain) CVSFile *cvsFile;

@end
