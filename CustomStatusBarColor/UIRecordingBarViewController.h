//
//  UIRecordingBarViewController.h
//  CustomStatusBarColor
//
//  Created by German Pereyra on 9/25/14.
//  Copyright (c) 2014 Leviatan Games. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol UIRecordingBarViewControllerDelegate <NSObject>
@required
- (void)didChangeModeToRecording:(NSNumber *)isRecording;
@end

@interface UIRecordingBarViewController : UIViewController

@property (nonatomic, strong) UILabel *recordingLabel;
@property (nonatomic, weak) id<UIRecordingBarViewControllerDelegate> delegate;

- (void)changeMode:(BOOL)recording;

@end
