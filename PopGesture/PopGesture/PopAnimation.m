//
//  PopAnimation.m
//  PopGesture
//
//  Created by 英策网络科技 on 16/6/29.
//  Copyright © 2016年 英策网络科技. All rights reserved.
//

#import "PopAnimation.h"
@interface PopAnimation ()
@end
@implementation PopAnimation
-(NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext{
    /**
     *  这个方法返回动画执行时间
     */
    return 0.25;
}
-(void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext{
    UIViewController*fromViewController=[transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController*toViewController=[transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIView*containerView=[transitionContext containerView];
    [containerView insertSubview:toViewController.view belowSubview:fromViewController.view];
    NSTimeInterval duration=[self transitionDuration:transitionContext];
    
    [UIView animateWithDuration:duration animations:^{
        fromViewController.view.transform=CGAffineTransformMakeTranslation([UIScreen mainScreen].bounds.size.width, 0);
    } completion:^(BOOL finished) {
        [transitionContext completeTransition:!transitionContext.transitionWasCancelled];
        
    }];
}
@end
