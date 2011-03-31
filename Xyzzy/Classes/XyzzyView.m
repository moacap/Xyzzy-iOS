//
//  XyzzyView.m
//  Xyzzy
//
//  Created by Broken Rim on 3/31/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "XyzzyView.h"


@implementation XyzzyView


- (id)initWithFrame:(CGRect)frame {
    if ((self = [super initWithFrame:frame])) {
        // Initialization code
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
    NSString *xyzzy = @"Hello, iOS!";
    CGPoint location = CGPointMake( 10, 20 );
    UIFont *font = [ UIFont systemFontOfSize:24.0 ];
    [ [ UIColor whiteColor ] set ];
    [ xyzzy drawAtPoint:location withFont:font ];
}

- (void)dealloc {
    [super dealloc];
}


@end
