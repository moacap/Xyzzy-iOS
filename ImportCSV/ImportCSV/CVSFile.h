//
//  CVSFile.h
//  ImportCSV
//
//  Created by Broken Rim on 7/13/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface CVSFile : NSObject {
    NSString *path;
}

@property (nonatomic, retain) NSString *path;

- (id)initWithFile:(NSString*)path;
- (NSString*)nameOfFile;

@end
