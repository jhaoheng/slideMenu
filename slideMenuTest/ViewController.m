//
//  ViewController.m
//  slideMenuTest
//
//  Created by jhaoheng on 2016/1/31.
//  Copyright © 2016年 max. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIButton *slideBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    slideBtn.frame = CGRectMake(0, 0, 100, 50);
    slideBtn.center = self.view.center;
    [slideBtn setTitle:@"slide Action" forState:UIControlStateNormal];
    slideBtn.backgroundColor = [UIColor orangeColor];
    [slideBtn addTarget:self action:@selector(slide_btn_action:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:slideBtn];
    
    //
    [self hello_slideMunu];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - slide
- (void)hello_slideMunu
{
    slideMenu = [slideViewController slide_initAndBaseOn:self];
    slideMenu.view.frame = CGRectMake(-self.view.frame.size.width, 0, self.view.frame.size.width, self.view.frame.size.height);
    slideMenu.menuArray = [NSArray arrayWithObjects:@"btn1",@"btn2",@"btn3",@"btn4", nil];
    slideMenu.slideMenu_backGround_color = [UIColor redColor];
    slideMenu.slideMask_backGround_color = [UIColor greenColor];
    slideMenu.passSideBtnAction_delegate = self;
    [self.view addSubview:slideMenu.view];
}

#pragma mark - slide act
- (void)slide_btn_action:(id)sender
{
    if (!slideMenu.is_lock) {
        [slideViewController switchSlideMove];
    }
}

#pragma mark - slide menu delegate
- (void)didSlideSideBtnFeedback:(id)sender
{
    NSLog(@"delegate pass : %@",(NSString *)sender);
}



@end
