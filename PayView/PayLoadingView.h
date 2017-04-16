//
//  PayLoadingView.h
//  PayAnimation
//
//  Created by 赵永闯 on 2017/4/16.
//  Copyright © 2017年 zhaoyongchuang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PayLoadingView : UIView

-(void)start;

-(void)hide;

+(PayLoadingView*)showIn:(UIView*)view;

+(PayLoadingView*)hideIn:(UIView*)view;

@end
