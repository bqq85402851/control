//
//  ViewController.m
//  PopGesture
//
//  Created by 英策网络科技 on 16/6/7.
//  Copyright © 2016年 英策网络科技. All rights reserved.
//

#import "ViewController.h"
#import "SecondViewController.h"
#ifdef DEBUG
#define debug_NSLog(format, ...) NSLog(format, ## __VA_ARGS__)
#else
#define debug_NSLog(format, ...)
#endif
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UIButton*button=[UIButton buttonWithType:UIButtonTypeSystem];
    [button setTitle:@"click" forState:UIControlStateNormal];
    button.frame=CGRectMake(100, 100, 100, 50);
    [button addTarget:self action:@selector(next) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    NSLog(@"111");
}
-(void)next{
    [self.navigationController pushViewController:[[SecondViewController alloc]init] animated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
