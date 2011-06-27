//
//  Issue.m
//  Untitled
//
//  Created by Broken Rim on 6/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Issue.h"

@implementation Issue

@dynamic uuid;
@dynamic description;

+ (NSDictionary*)elementToPropertyMappings {
	return [NSDictionary dictionaryWithKeysAndObjects:
			@"uuid", @"uuid",
			@"description", @"description",
			nil];
}

+ (NSString*)primaryKeyProperty {
	return @"uuid";
}

@end
