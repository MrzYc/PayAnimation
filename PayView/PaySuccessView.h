//
//  PaySuccessView.h
//  PayAnimation
//
//  Created by 赵永闯 on 2017/4/16.
//  Copyright © 2017年 zhaoyongchuang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PaySuccessView : UIView <CAAnimationDelegate>

- (void)startAnimation;

- (void)hideAnimation;

+(PaySuccessView *)showIn:(UIView*)view;

+(PaySuccessView *)hideIn:(UIView*)view;

@end
