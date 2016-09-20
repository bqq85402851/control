//
//  NavigationInteractiveTransition.h
//  PopGesture
//
//  Created by 英策网络科技 on 16/6/29.
//  Copyright © 2016年 英策网络科技. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface NavigationInteractiveTransition : NSObject<UINavigationControllerDelegate>
- (instancetype)initWithViewController:(UIViewController *)vc;
-(void)handleControllerPop:(UIPanGestureRecognizer*)recognizer;
@end
