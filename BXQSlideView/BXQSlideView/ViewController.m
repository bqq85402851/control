//
//  ViewController.m
//  BXQSlideView
//
//  Created by 英策网络科技 on 16/3/9.
//  Copyright © 2016年 英策网络科技. All rights reserved.
//

#import "ViewController.h"
#import "UILabel+Slide.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UILabel*label=[[UILabel alloc]initWithFrame:CGRectMake(50, 100, 300, 40)];
    label.text=@">滑动解锁";
    label.textAlignment=NSTextAlignmentCenter;
    [self.view addSubview:label];
    [label addSlideAnimation:^(CAGradientLayer *layer) {
        [self.view.layer addSublayer:layer];
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
