//
//  UILabel+Slide.m
//  color
//
//  Created by 英策网络科技 on 15/10/21.
//  Copyright © 2015年 英策网络科技. All rights reserved.
//

#import "UILabel+Slide.h"

@implementation UILabel (Slide)
-(void)addSlideAnimation:(layerBlock)layer{
    CAGradientLayer*gradientLayer=[CAGradientLayer layer];
    gradientLayer.frame=self.frame;
    gradientLayer.colors=@[(id)[UIColor blackColor].CGColor,(id)[UIColor whiteColor].CGColor,(id)[UIColor blackColor].CGColor];
    gradientLayer.startPoint=CGPointMake(0, 0.5);
    gradientLayer.endPoint=CGPointMake(1, 0.5);
    gradientLayer.locations=@[[NSNumber numberWithFloat:0.2],[NSNumber numberWithFloat:0.5],[NSNumber numberWithFloat:0.8]];
    if (layer) {
        layer(gradientLayer);
    }
    gradientLayer.mask=self.layer;
    self.frame=gradientLayer.bounds;
    
    CABasicAnimation*gradient=[CABasicAnimation animationWithKeyPath:@"locations"];
    gradient.fromValue=@[[NSNumber numberWithFloat:0],[NSNumber numberWithFloat:0],[NSNumber numberWithFloat:0.25]];
    gradient.toValue=@[[NSNumber numberWithFloat:0.75],[NSNumber numberWithFloat:1],[NSNumber numberWithFloat:1]];
    gradient.duration=2.5;
    gradient.repeatCount=HUGE;
    [gradientLayer addAnimation:gradient forKey:nil];
    
}

@end
