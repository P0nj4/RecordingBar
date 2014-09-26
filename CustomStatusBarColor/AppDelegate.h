//
//  AppDelegate.h
//  CustomStatusBarColor
//
//  Created by German Pereyra on 9/25/14.
//  Copyright (c) 2014 Leviatan Games. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIRecordingBar.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate, UIRecordingBarDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) UIRecordingBar *bar;

@end
