//
//  DetailViewController.h
//  ImportCSV
//
//  Created by Broken Rim on 7/13/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "CSVFile.h"

@interface FileViewController : UITableViewController {
    CSVFile *cvsFile;
    NSMutableArray *lineList;
}

@property (nonatomic,retain) CSVFile *cvsFile;

@end
