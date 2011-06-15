//
//  CackHTTPConnection.h
//  Untitled
//
//  Created by Broken Rim on 6/14/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HTTPConnection.h"

@interface CackHTTPConnection : HTTPConnection {

    NSObject<HTTPResponse> *response_;

}

@property (nonatomic, retain) NSObject<HTTPResponse> *response;

+ (void)setMOC:(NSManagedObjectContext *)value;
+ (NSManagedObjectContext *) getMOC;

- (void) respond: ( NSInteger ) status;
- (void) respond: ( NSInteger ) status withString: ( NSString* ) string;

@end
