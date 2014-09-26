//
//  UIRecordingBar.h
//  CustomStatusBarColor
//
//  Created by German Pereyra on 9/25/14.
//  Copyright (c) 2014 Leviatan Games. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol UIRecordingBarDelegate <NSObject>

@required
- (void)didChangeToRecording;
- (void)didChangeToPause;
@end


@interface UIRecordingBar : NSObject

@property (nonatomic, weak) id<UIRecordingBarDelegate> delegate;

+ (instancetype)sharedInstance;

- (void)setBarVisible:(BOOL)visible;
- (void)changeMode:(BOOL)recording;

@end
