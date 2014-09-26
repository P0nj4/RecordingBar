//
//  UIRecordingBarViewController.m
//  CustomStatusBarColor
//
//  Created by German Pereyra on 9/25/14.
//  Copyright (c) 2014 Leviatan Games. All rights reserved.
//

#import "UIRecordingBarViewController.h"

@interface UIRecordingBarViewController ()
@property (nonatomic) BOOL isRecording;
@end

@implementation UIRecordingBarViewController
@synthesize recordingLabel;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (instancetype)initWithView:(UIView *)view{
    self = [super init];
    if (self) {
        self.view = view;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.isRecording = YES;
    
    self.view.backgroundColor = [UIColor redColor];
    recordingLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.view.center.x - 150, 0, 300, 20)];
    recordingLabel.textAlignment = NSTextAlignmentCenter;
    recordingLabel.text = @"Recording";
    recordingLabel.font = [UIFont boldSystemFontOfSize:12];
    recordingLabel.backgroundColor = [UIColor clearColor];
    recordingLabel.textColor = [UIColor blackColor];
    recordingLabel.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin |  UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin;
    [self.view addSubview:recordingLabel];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration; {
    [super willRotateToInterfaceOrientation:toInterfaceOrientation duration:duration];
    self.view.window.hidden = YES; // Bad animation workaround
}

- (void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation; {
    [super didRotateFromInterfaceOrientation:fromInterfaceOrientation];
    self.view.window.hidden = NO; // Bad animation workaround
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    [self changeMode:!self.isRecording];
    if (self.delegate && [self.delegate respondsToSelector:@selector(didChangeModeToRecording:)]) {
        [self.delegate performSelector:@selector(didChangeModeToRecording:) withObject:[NSNumber numberWithBool:self.isRecording]];
    }
}


- (void)changeMode:(BOOL)recording {
    self.isRecording = recording;
    if (!recording) {
        [UIView animateWithDuration:1.0 animations:^{
            self.view.backgroundColor = [UIColor grayColor];
            self.recordingLabel.alpha = 0;
        }completion:^(BOOL finished) {
            self.recordingLabel.textColor = [UIColor whiteColor];
            self.recordingLabel.text = @"On pause";
            [UIView animateWithDuration:0.3 animations:^{
                self.recordingLabel.alpha = 1;
            }];
        }];
    } else {
        [UIView animateWithDuration:1.0 animations:^{
            self.view.backgroundColor = [UIColor redColor];
            
            self.recordingLabel.alpha = 0;
        }completion:^(BOOL finished) {
            self.recordingLabel.textColor = [UIColor blackColor];
            recordingLabel.text = @"Recording";
            [UIView animateWithDuration:0.3 animations:^{
                self.recordingLabel.alpha = 1;
            }];
        }];
    }
}

@end
