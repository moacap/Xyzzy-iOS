//
//  Un2AppDelegate.h
//  Un2
//
//  Created by Broken Rim on 6/24/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Un2ViewController;

@interface Un2AppDelegate : NSObject <UIApplicationDelegate> {

}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet Un2ViewController *viewController;

@end
