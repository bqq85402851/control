//
//  NavigationInteractiveTransition.m
//  PopGesture
//
//  Created by 英策网络科技 on 16/6/29.
//  Copyright © 2016年 英策网络科技. All rights reserved.
//

#import "NavigationInteractiveTransition.h"
#import "PopAnimation.h"
@interface NavigationInteractiveTransition ()
@property(nonatomic,weak)UINavigationController*vc;
@property(nonatomic,strong)UIPercentDrivenInteractiveTransition*interactivePopTransition;
@end
@implementation NavigationInteractiveTransition
- (instancetype)initWithViewController:(UIViewController *)vc
{
    self = [super init];
    if (self) {
        self.vc = (UINavigationController *)vc;
        self.vc.delegate = self;
    }
    return self;
}
-(void)handleControllerPop:(UIPanGestureRecognizer *)recognizer{
    CGFloat progress=[recognizer translationInView:recognizer.view].x/recognizer.view.bounds.size.width;
    progress=MIN(1, MAX(0.0, progress));
    if (recognizer.state==UIGestureRecognizerStateBegan) {
        self.interactivePopTransition=[[UIPercentDrivenInteractiveTransition alloc]init];
        [self.vc popViewControllerAnimated:YES];
    }
    else if (recognizer.state==UIGestureRecognizerStateChanged){
        [self.interactivePopTransition updateInteractiveTransition:progress];
    }
    else if (recognizer.state==UIGestureRecognizerStateEnded||recognizer.state==UIGestureRecognizerStateCancelled){
        if (progress>0.5) {
            [self.interactivePopTransition finishInteractiveTransition];
        }else{
            [self.interactivePopTransition cancelInteractiveTransition];
        }
        self.interactivePopTransition=nil;
    }
}
/**
 *  用来重写控制器之间的转场动画
    PopAnimation是我们自定义的一个遵守UIViewControllerAnimatedTransitioning协议的用来控制转场动画的类
 */
-(id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC{
    if (operation==UINavigationControllerOperationPop) {
        return [[PopAnimation alloc]init];
    }
    return nil;
}
/**
 *  返回一个交互对象,用来实时管理控制器之间转场动画的完成度,通过它我们可以让控制器的专场动画与用户交互
    UIPercentDrivenInteractiveTransition是苹果提供给我们的一个遵守UIViewControllerInteractiveTransitioning协议的用来管理控制器之间转场动画的完成度的工具
 */
-(id<UIViewControllerInteractiveTransitioning>)navigationController:(UINavigationController *)navigationController interactionControllerForAnimationController:(id<UIViewControllerAnimatedTransitioning>)animationController{
    if ([animationController isKindOfClass:[PopAnimation class]]) {
        return self.interactivePopTransition;
    }
    return nil;
}
@end
