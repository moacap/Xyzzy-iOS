//
//  Issue.h
//  Untitled
//
//  Created by Broken Rim on 6/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <RestKit/RestKit.h>
#import <RestKit/CoreData/CoreData.h>

@interface Issue : RKManagedObject {

}

@property (nonatomic, retain) NSString* uuid;
@property (nonatomic, retain) NSString* description;

@end
