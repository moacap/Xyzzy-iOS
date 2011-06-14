//
//  CackResponse.h
//  Untitled
//
//  Created by Broken Rim on 6/14/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HTTPDataResponse.h"


@interface CackResponse : HTTPDataResponse {

    NSInteger status;

}

@property (nonatomic) NSInteger status;

@end
