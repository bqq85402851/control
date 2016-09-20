//
//  firstVC.m
//  XianyuTabbar
//
//  Created by 英策网络科技 on 16/8/9.
//  Copyright © 2016年 英策网络科技. All rights reserved.
//

#import "firstVC.h"
#import "subVC.h"
#import "RDVTabBarController.h"
@implementation firstVC
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor=[UIColor redColor];
    UIButton*button=[UIButton buttonWithType:UIButtonTypeSystem];
    [button setTitle:@"test" forState:UIControlStateNormal];
    button.frame=CGRectMake(100, 120, 100, 100);
    [button addTarget:self action:@selector(next) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}
-(void)next{
    [[self rdv_tabBarController]setTabBarHidden:YES animated:YES];
    [self.navigationController pushViewController:[[subVC alloc]init] animated:YES];
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [[self rdv_tabBarController]setTabBarHidden:NO animated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
