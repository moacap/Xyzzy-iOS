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

+ (void)setMOC:(NSManagedObjectContext *)value {
    managedObjectContext_ = value;
}

+ (NSManagedObjectContext *) getMOC {
    return managedObjectContext_;
}

- (BOOL)supportsMethod:(NSString *)method atPath:(NSString *)path {
	HTTPLogTrace();
	
	if ([method isEqualToString:@"POST"]) {

	}
	
	return [super supportsMethod:method atPath:path];
}

- (BOOL)expectsRequestBodyFromMethod:(NSString *)method atPath:(NSString *)path {
	HTTPLogTrace();
	
	if([method isEqualToString:@"POST"])
		return YES;
	
	return [super expectsRequestBodyFromMethod:method atPath:path];
}

- (NSObject<HTTPResponse> *)httpResponseForMethod:(NSString *)method URI:(NSString *)path {
	HTTPLogTrace();
	
    NSManagedObjectContext *context = [[self class] getMOC];
    NSError *error;

	NSDictionary *params = [self parseGetParams];
    NSString *message = [[[NSString alloc] initWithFormat:@"Hello, World (%@): %@", path, [params valueForKey:@"xyzzy"]] autorelease];

	if (YES || [method isEqualToString:@"POST"]) {
	    if (YES || [path isEqualToString:@"/issue/create"]) {
            
            NSManagedObject *issue = [NSEntityDescription
                                            insertNewObjectForEntityForName:@"Issue" 
                                            inManagedObjectContext:context];
            //[issue setValue:[params valueForKey:@"uuid"] forKey:@"uuid"];
            [issue setValue:@"Derpity" forKey:@"uuid"];
            [issue setValue:[params valueForKey:@"description"] forKey:@"description_"];

            if (![context save:&error]) {
                NSLog(@"Whoops, couldn't save: %@", [error localizedDescription]);
            }
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

    CackResponse *response = [[[CackResponse alloc] initWithData:[message dataUsingEncoding:NSUTF8StringEncoding]] autorelease];
    response.status = 404;
    return response;
	
	//if ([method isEqualToString:@"POST"] && [path isEqualToString:@"/post.html"])
	//{
	//    HTTPLogVerbose(@"%@[%p]: postContentLength: %qu", THIS_FILE, self, requestContentLength);
		
	//    NSString *postStr = nil;
		
	//    NSData *postData = [request body];
	//    if (postData)
	//    {
	//        postStr = [[[NSString alloc] initWithData:postData encoding:NSUTF8StringEncoding] autorelease];
	//    }
		
	//    HTTPLogVerbose(@"%@[%p]: postStr: %@", THIS_FILE, self, postStr);
		
	//    // Result will be of the form "answer=..."
		
	//    int answer = [[postStr substringFromIndex:7] intValue];
		
	//    NSData *response = nil;
	//    if(answer == 10)
	//    {
	//        response = [@"<html><body>Correct<body></html>" dataUsingEncoding:NSUTF8StringEncoding];
	//    }
	//    else
	//    {
	//        response = [@"<html><body>Sorry - Try Again<body></html>" dataUsingEncoding:NSUTF8StringEncoding];
	//    }
		
	//    return [[[HTTPDataResponse alloc] initWithData:response] autorelease];
	
	// }
	
	return [super httpResponseForMethod:method URI:path];
}

@end
