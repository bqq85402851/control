//
//  UILabel+Slide.h
//  color
//
//  Created by 英策网络科技 on 15/10/21.
//  Copyright © 2015年 英策网络科技. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void (^layerBlock)(CAGradientLayer*layer);
@interface UILabel (Slide)
/**增加滑动效果*/
-(void)addSlideAnimation:(layerBlock)layer;
@end
