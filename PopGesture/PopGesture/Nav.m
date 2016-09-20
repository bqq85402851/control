//
//  Nav.m
//  PopGesture
//
//  Created by 英策网络科技 on 16/6/21.
//  Copyright © 2016年 英策网络科技. All rights reserved.
//

#import "Nav.h"
#import "NavigationInteractiveTransition.h"
@interface Nav()<UIGestureRecognizerDelegate>
@property (nonatomic, strong) NavigationInteractiveTransition *navT;
@end
@implementation Nav
-(void)viewDidLoad{
    [super viewDidLoad];
    //禁用系统的滑动返回收拾
    UIGestureRecognizer*gesture=self.interactivePopGestureRecognizer;
    gesture.enabled=NO;
    UIView*gestureView=gesture.view;
    
    UIPanGestureRecognizer*popRecognizer=[[UIPanGestureRecognizer alloc]init];
    popRecognizer.delegate=self;
    popRecognizer.maximumNumberOfTouches=1;
    [gestureView addGestureRecognizer:popRecognizer];
    
    _navT = [[NavigationInteractiveTransition alloc] initWithViewController:self];
    [popRecognizer addTarget:_navT action:@selector(handleControllerPop:)];
}

- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer {
    /**
     *  这里有两个条件不允许手势执行，1、当前控制器为根控制器；2、如果这个push、pop动画正在执行（私有属性）
     */
    return self.viewControllers.count != 1 && ![[self valueForKey:@"_isTransitioning"] boolValue];
}
@end
