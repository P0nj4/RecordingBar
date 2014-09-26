//
//  UIRecordingBar.m
//  CustomStatusBarColor
//
//  Created by German Pereyra on 9/25/14.
//  Copyright (c) 2014 Leviatan Games. All rights reserved.
//

#import "UIRecordingBar.h"
#import "UIRecordingBarWindow.h"
#import "UIRecordingBarViewController.h"
#import "SecondViewController.h"

static UIRecordingBar *sharedInstance;

@interface UIRecordingBar () <UIRecordingBarViewControllerDelegate>
@property (nonatomic, strong) UIRecordingBarWindow *window;
@property (nonatomic, strong) UIRecordingBarViewController *viewController;
@end

@implementation UIRecordingBar

+ (instancetype)sharedInstance {
    if (!sharedInstance) {
        sharedInstance = [[self alloc] init];
    }
    return sharedInstance;
}


- (void)setBarVisible:(BOOL)visible{
    if (visible && !self.window) {
        self.window = [[UIRecordingBarWindow alloc] init];
        self.window.backgroundColor = [UIColor whiteColor];
        self.window.windowLevel = UIWindowLevelAlert;
        self.viewController = [[UIRecordingBarViewController alloc] init];
        self.viewController.delegate = self;
        self.window.rootViewController = self.viewController;
        [self.window makeKeyAndVisible];
    } else if (!visible && self.window) {
        self.window = nil;
        self.viewController = nil;
    }
}

- (void)didChangeModeToRecording:(NSNumber *)isRecording{
    BOOL internalIsRecording = [isRecording boolValue];
    if (internalIsRecording) {
        if (self.delegate && [self.delegate respondsToSelector:@selector(didChangeToRecording)]) {
            [self.delegate performSelector:@selector(didChangeToRecording)];
        }
    } else {
        if (self.delegate && [self.delegate respondsToSelector:@selector(didChangeToPause)]) {
            [self.delegate performSelector:@selector(didChangeToPause)];
        }
    }
    
}

- (void)changeMode:(BOOL)recording {
    [self.viewController changeMode:recording];
}

@end
