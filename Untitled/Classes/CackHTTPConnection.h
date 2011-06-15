//
//  CackHTTPConnection.h
//  Untitled
//
//  Created by Broken Rim on 6/14/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HTTPConnection.h"
#import "CackRequest.h"

@interface CackHTTPConnection : HTTPConnection {

    NSObject<HTTPResponse> *response_;
    void (^run_)(void);

}

@property (nonatomic, retain) NSObject<HTTPResponse> *response;

+ (void)setRun:(void(^)(void))value;
+ (void (^)(void)) getRun;

+ (void)setMOC:(NSManagedObjectContext *)value;
+ (NSManagedObjectContext *) getMOC;

- (void) run:( CackRequest* )request;
- (void) respond:( NSInteger )status;
- (void) respond:( NSInteger )status withString:( NSString* )string;

@end
