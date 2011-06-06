#import "PhotoSet.h"
#import "Photo.h"

@implementation PhotoSet
@synthesize title = _title;
@synthesize photos = _photos;

- (id) initWithTitle:(NSString *)title photos:(NSArray *)photos {
    if ((self = [super init])) {
        self.title = title;
        self.photos = photos;
        for(int i = 0; i < _photos.count; ++i) {
            Photo *photo = [_photos objectAtIndex:i];
            photo.photoSource = self;
            photo.index = i;
        }        
    }
    return self;
}

- (void) dealloc {
    self.title = nil;
    self.photos = nil;    
    [super dealloc];
}

#pragma mark TTModel

- (BOOL)isLoading { 
    return FALSE;
}

- (BOOL)isLoaded {
    return TRUE;
}

#pragma mark TTPhotoSource

- (NSInteger)numberOfPhotos {
    return _photos.count;
}

- (NSInteger)maxPhotoIndex {
    return _photos.count-1;
}

- (id<TTPhoto>)photoAtIndex:(NSInteger)photoIndex {
    if (photoIndex < _photos.count) {
        return [_photos objectAtIndex:photoIndex];
    } else {
        return nil;
    }
}

static PhotoSet *samplePhotoSet = nil;

+ (PhotoSet *) samplePhotoSet {
    @synchronized(self) {
        if (samplePhotoSet == nil) {
            Photo *mathNinja = [[[Photo alloc] initWithCaption:@"Math Ninja" 
                                                      urlLarge:@"http://d1xzuxjlafny7l.cloudfront.net/downloads/math_ninja_large.jpg" 
                                                      urlSmall:@"bundle://math_ninja_small.png" 
                                                      urlThumb:@"bundle://flower01-320.jpg" 
                                                          size:CGSizeMake(1024, 768)] autorelease];
            Photo *instantPoetry = [[[Photo alloc] initWithCaption:@"Instant Poetry" 
                                                          urlLarge:@"http://d1xzuxjlafny7l.cloudfront.net/downloads/instant_poetry_large.jpg" 
                                                          urlSmall:@"bundle://instant_poetry_small.png" 
                                                          urlThumb:@"bundle://flower01-320.jpg" 
                                                              size:CGSizeMake(1024, 748)] autorelease];
            Photo *rpgCalc = [[[Photo alloc] initWithCaption:@"RPG Calc" 
                                                    urlLarge:@"http://d1xzuxjlafny7l.cloudfront.net/downloads/rpg_calc_large.jpg" 
                                                    urlSmall:@"bundle://rpg_calc_small.png" 
                                                    urlThumb:@"bundle://flower01-320.jpg" 
                                                        size:CGSizeMake(640, 920)] autorelease];
            Photo *levelMeUp = [[[Photo alloc] initWithCaption:@"Level Me Up" 
                                                      urlLarge:@"http://d1xzuxjlafny7l.cloudfront.net/downloads/level_me_up_large.jpg" 
                                                      urlSmall:@"bundle://level_me_up_small.png" 
                                                      urlThumb:@"bundle://flower01-320.jpg" 
                                                          size:CGSizeMake(1024, 768)] autorelease];
            NSArray *photos = [NSArray arrayWithObjects:mathNinja, instantPoetry, rpgCalc, levelMeUp, nil];
            samplePhotoSet = [[self alloc] initWithTitle:@"My Apps" photos:photos];
        }
    }
    return samplePhotoSet;
}

@end
