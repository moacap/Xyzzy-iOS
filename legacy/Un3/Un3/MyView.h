//
//  MyView.h
//  Un3
//
//  Created by Broken Rim on 6/25/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface MyView : UIViewController {
    
    UITextView *logView;
}

@property (nonatomic, retain) IBOutlet UITextView *logView;


@end
