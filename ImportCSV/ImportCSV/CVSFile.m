//
//  CVSFile.m
//  ImportCSV
//
//  Created by Broken Rim on 7/13/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "CVSFile.h"

@implementation CVSFile

@synthesize path;

- (id)initWithFile:(NSString *)path_ {
    self = [super init];
    if (self) {
        self.path = path_;
    }
    return self;
}

- (NSString*)nameOfFile {
    return [[NSFileManager defaultManager] displayNameAtPath:self.path];
}


@end
