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

}

+ (void)setMOC:(NSManagedObjectContext *)value;
+ (NSManagedObjectContext *) getMOC;

@end
