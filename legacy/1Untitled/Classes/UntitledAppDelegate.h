//
//  UntitledAppDelegate.h
//  Untitled
//
//  Created by Broken Rim on 6/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class UntitledViewController;

@interface UntitledAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    UntitledViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UntitledViewController *viewController;

@end

