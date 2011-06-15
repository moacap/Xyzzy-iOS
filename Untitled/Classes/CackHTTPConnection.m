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
#import "CackResponse.h"

static const int httpLogLevel = HTTP_LOG_LEVEL_WARN; // | HTTP_LOG_FLAG_TRACE;
static NSManagedObjectContext *managedObjectContext_;

@implementation CackHTTPConnection

@synthesize response = response_;

+ (void)setMOC:(NSManagedObjectContext *)value {
    managedObjectContext_ = value;
}

+ (NSManagedObjectContext *) getMOC {
    return managedObjectContext_;
}

- (void) respond: ( NSInteger ) status {
    CackResponse *response = [[[CackResponse alloc] init] autorelease];
    response.status = status;
    self.response = response;
}

- (void) respond: ( NSInteger ) status withString: ( NSString* ) string {
    CackResponse *response = [[[CackResponse alloc] initWithData:[string dataUsingEncoding:NSUTF8StringEncoding]] autorelease];
    response.status = status;
    self.response = response;
}

- (NSObject<HTTPResponse> *)httpResponseForMethod:(NSString *)method URI:(NSString *)path {
	HTTPLogTrace();
	
    NSManagedObjectContext *context = [[self class] getMOC];
    NSError *error;

	NSDictionary *params = [self parseGetParams];
    NSString *message = [[[NSString alloc] initWithFormat:@"Hello, World (%@): %@", path, [params valueForKey:@"xyzzy"]] autorelease];

	if (YES || [method isEqualToString:@"POST"]) {
	    if ([path isEqualToString:@"/issue/create"]) {
            
            NSManagedObject *issue = [NSEntityDescription
                                            insertNewObjectForEntityForName:@"Issue" 
                                            inManagedObjectContext:context];
            //[issue setValue:[params valueForKey:@"uuid"] forKey:@"uuid"];
            [issue setValue:@"Derpity" forKey:@"uuid"];
            [issue setValue:[params valueForKey:@"description"] forKey:@"description_"];

            if (![context save:&error]) {
                NSLog(@"Whoops, couldn't save: %@", [error localizedDescription]);
            }

            [self respond:200 withString:@"Create!"];
        }
        else {
            [self respond:200 withString:message];
        }
    }
	
	NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
	NSEntityDescription *entity = [NSEntityDescription 
								   entityForName:@"Issue" inManagedObjectContext:context];
	[fetchRequest setEntity:entity];
	NSArray *result = [context executeFetchRequest:fetchRequest error:&error];
	for (NSManagedObject *_issue in result) {
		NSLog(@"issue: %@ %@", [_issue valueForKey:@"uuid"], [_issue valueForKey:@"description_"]);
	}        
	[fetchRequest release];

    //CackResponse *response = [[[CackResponse alloc] initWithData:[message dataUsingEncoding:NSUTF8StringEncoding]] autorelease];
    //response.status = 404;
    //return response;
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
