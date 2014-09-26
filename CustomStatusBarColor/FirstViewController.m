//
//  FirstViewController.m
//  CustomStatusBarColor
//
//  Created by German Pereyra on 9/25/14.
//  Copyright (c) 2014 Leviatan Games. All rights reserved.
//

#import "FirstViewController.h"
#import "SecondViewController.h"
#import "UIRecordingBar.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    /*
    
    UIView *addStatusBar = [[UIView alloc] init];
    addStatusBar.frame = CGRectMake(0, -20, self.view.bounds.size.width, 20);
    addStatusBar.backgroundColor = [UIColor redColor];
    [self.view addSubview:addStatusBar];
    [self.navigationController.navigationBar addSubview:addStatusBar];
    */
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [btn setTitle:@"Go To Second" forState:UIControlStateNormal];
    btn.frame = CGRectMake(30, 100, 200, 44);
    [btn addTarget:self action:@selector(goNext) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}


- (void)goNext{
    SecondViewController *vc = [[SecondViewController alloc] init];

    [self.navigationController pushViewController:vc animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
