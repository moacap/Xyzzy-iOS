//
//  CackHTTPConnection.m
//  Untitled
//
//  Created by Broken Rim on 6/14/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "CackHTTPConnection.h"

#import "HTTPMessage.h"
#import "HTTPDataResponse.h"
#import "DDNumber.h"
#import "HTTPLogging.h"
#import "CackRequest.h"
#import "CackResponse.h"

static const int httpLogLevel = HTTP_LOG_LEVEL_WARN; // | HTTP_LOG_FLAG_TRACE;
static CackRun run_;

@implementation CackHTTPConnection

@synthesize response = response_;

+ (void)setRun:(CackRun)value {
    run_ = [value copy];
}

+ (CackRun) getRun {
    return run_;
}

- (void) respond:( NSInteger )status {
    CackResponse *response = [[[CackResponse alloc] init] autorelease];
    response.status = status;
    self.response = response;
}

- (void) respond:( NSInteger )status withString:( NSString* )string {
    CackResponse *response = [[[CackResponse alloc] initWithData:[string dataUsingEncoding:NSUTF8StringEncoding]] autorelease];
    response.status = status;
    self.response = response;
}

- (void) run:( CackRequest* )request_ {

    if ( [[self class] getRun] != nil ) {
        [[self class] getRun](request_, self);
    }
}

- (NSObject<HTTPResponse> *)httpResponseForMethod:(NSString *)method URI:(NSString *)path {
	HTTPLogTrace();
	
    CackRequest *request_ = [[[CackRequest alloc] init] autorelease];
    request_.method = method;
    request_.path = path;

    [self run:request_];

    if ( self.response != nil ) {
        return self.response;
    }
	
	return [super httpResponseForMethod:method URI:path];
}

//- (BOOL)supportsMethod:(NSString *)method atPath:(NSString *)path {
//    HTTPLogTrace();
	
//    if ([method isEqualToString:@"POST"]) {

//    }
	
//    return [super supportsMethod:method atPath:path];
//}

//- (BOOL)expectsRequestBodyFromMethod:(NSString *)method atPath:(NSString *)path {
//    HTTPLogTrace();
	
//    if([method isEqualToString:@"POST"])
//        return YES;
	
//    return [super expectsRequestBodyFromMethod:method atPath:path];
//}

@end
