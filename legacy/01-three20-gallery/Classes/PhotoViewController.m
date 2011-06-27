#import "PhotoViewController.h"
#import "PhotoSet.h"

@implementation PhotoViewController
@synthesize photoSet = _photoSet;

- (void) viewDidLoad {
    self.photoSource = [PhotoSet samplePhotoSet];
}

- (void) dealloc {
    self.photoSet = nil;    
    [super dealloc];
}

@end