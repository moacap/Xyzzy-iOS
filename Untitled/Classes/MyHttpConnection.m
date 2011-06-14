#import "MyHTTPConnection.h"
#import "HTTPMessage.h"
#import "HTTPDataResponse.h"
#import "DDNumber.h"
#import "HTTPLogging.h"

// Log levels : off, error, warn, info, verbose
// Other flags: trace
static const int httpLogLevel = HTTP_LOG_LEVEL_WARN; // | HTTP_LOG_FLAG_TRACE;


/**
 * All we have to do is override appropriate methods in HTTPConnection.
 **/

@implementation MyHTTPConnection

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

- (NSObject<HTTPResponse> *)httpResponseForMethod:(NSString *)method URI:(NSString *)path
{
	HTTPLogTrace();
	
	NSDictionary *params = [self parseGetParams];
	NSString *message = [[[NSString alloc] initWithFormat:@"Hello, World: %@", [params valueForKey:@"xyzzy"]] autorelease];
	
	return [[[HTTPDataResponse alloc] initWithData:[message dataUsingEncoding:NSUTF8StringEncoding]] autorelease];
	
	
	/*
	if ([method isEqualToString:@"POST"] && [path isEqualToString:@"/post.html"])
	{
		HTTPLogVerbose(@"%@[%p]: postContentLength: %qu", THIS_FILE, self, requestContentLength);
		
		NSString *postStr = nil;
		
		NSData *postData = [request body];
		if (postData)
		{
			postStr = [[[NSString alloc] initWithData:postData encoding:NSUTF8StringEncoding] autorelease];
		}
		
		HTTPLogVerbose(@"%@[%p]: postStr: %@", THIS_FILE, self, postStr);
		
		// Result will be of the form "answer=..."
		
		int answer = [[postStr substringFromIndex:7] intValue];
		
		NSData *response = nil;
		if(answer == 10)
		{
			response = [@"<html><body>Correct<body></html>" dataUsingEncoding:NSUTF8StringEncoding];
		}
		else
		{
			response = [@"<html><body>Sorry - Try Again<body></html>" dataUsingEncoding:NSUTF8StringEncoding];
		}
		
		return [[[HTTPDataResponse alloc] initWithData:response] autorelease];
	
	 }*/
	
	return [super httpResponseForMethod:method URI:path];
}


- (void)processBodyData:(NSData *)postDataChunk
{
	HTTPLogTrace();

	BOOL result = [request appendData:postDataChunk];
	if (!result)
	{
		HTTPLogError(@"%@[%p]: %@ - Couldn't append bytes!", THIS_FILE, self, THIS_METHOD);
	}
}

@end
