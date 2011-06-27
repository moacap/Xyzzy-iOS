#import <Foundation/Foundation.h>
#import <Three20/Three20.h>
#import "ThumbsViewController.h"

@class PhotoSet;

@interface PhotoViewController : ThumbsViewController {
    PhotoSet *_photoSet;
}

@property (nonatomic, retain) PhotoSet *photoSet;

@end