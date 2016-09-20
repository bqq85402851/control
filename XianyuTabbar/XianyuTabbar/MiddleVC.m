//
//  MiddleVC.m
//  XianyuTabbar
//
//  Created by 英策网络科技 on 16/8/9.
//  Copyright © 2016年 英策网络科技. All rights reserved.
//

#import "MiddleVC.h"
#import "subVC.h"
@implementation MiddleVC
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor=[UIColor cyanColor];
    
    
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"back"] style:UIBarButtonItemStyleDone target:self action:@selector(pop)];
    self.navigationItem.leftBarButtonItem = backItem;
    
    UIButton*button=[UIButton buttonWithType:UIButtonTypeSystem];
    [button setTitle:@"test" forState:UIControlStateNormal];
    button.frame=CGRectMake(100, 120, 100, 100);
    [button addTarget:self action:@selector(next) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}
- (void)pop
{
    [self dismissViewControllerAnimated:YES completion:nil];
    
}
-(void)next{
    [self.navigationController pushViewController:[[subVC alloc]init] animated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
