#import <Foundation/Foundation.h>
#import "HTTPConnection.h"

@interface MyHTTPConnection : HTTPConnection

+ (void)setMOC:(NSManagedObjectContext *)value;
+ (NSManagedObjectContext *) getMOC;

@end
