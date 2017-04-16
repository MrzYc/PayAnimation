//
//  PaySuccessView.m
//  PayAnimation
//
//  Created by 赵永闯 on 2017/4/16.
//  Copyright © 2017年 zhaoyongchuang. All rights reserved.
//

#import "PaySuccessView.h"


static CGFloat lineWidth = 4.0f;
static CGFloat circleDuriation = 0.5f;
static CGFloat checkDuration = 0.2f;

#define PayColor [UIColor colorWithRed:16/255.0 green:142/255.0 blue:233/255.0 alpha:1]

@implementation PaySuccessView
{
    CALayer *_animationLayer;
}


- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor clearColor];
        [self setupLayer];
    }
    return self;
}


- (void)setupLayer {
    _animationLayer = [CALayer layer];
    _animationLayer.bounds = CGRectMake(0, 0, 60, 60);
    _animationLayer.position = CGPointMake(self.bounds.size.width/2, self.bounds.size.height/2);
    [self.layer addSublayer:_animationLayer];

}

//显示
+(PaySuccessView*)showIn:(UIView*)view{
    [self hideIn:view];
    PaySuccessView *hud = [[PaySuccessView alloc] initWithFrame:view.bounds];
    [hud startAnimation];
    [view addSubview:hud];
    return hud;
}

//隐藏
+(PaySuccessView *)hideIn:(UIView *)view{
    PaySuccessView *hud = nil;
    for (PaySuccessView *subView in view.subviews) {
        if ([subView isKindOfClass:[PaySuccessView class]]) {
            [subView hideAnimation];
            [subView removeFromSuperview];
            hud = subView;
        }
    }
    return hud;
}

//开始动画
- (void)startAnimation {
    [self circleAnimation];
    dispatch_time_t time = dispatch_time(DISPATCH_TIME_NOW, 0.8 * circleDuriation * NSEC_PER_SEC);
    dispatch_after(time, dispatch_get_main_queue(), ^(void){
        [self checkAnimation];
    });
}

- (void)hideAnimation {
    for (CALayer *layer in _animationLayer.sublayers) {
        [layer removeAllAnimations];
    }
}

//画圆
- (void)circleAnimation {
    CAShapeLayer *circleLayer = [CAShapeLayer layer];
    circleLayer.frame = _animationLayer.bounds;
    [_animationLayer addSublayer:circleLayer];
    circleLayer.fillColor =  [[UIColor clearColor] CGColor];
    circleLayer.strokeColor  = PayColor.CGColor;
    circleLayer.lineWidth = lineWidth;
    circleLayer.lineCap = kCALineCapRound;
    
    
    CGFloat lineWidth = 5.0f;
    CGFloat radius = _animationLayer.bounds.size.width / 2.0f - lineWidth / 2.0f;
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:circleLayer.position radius:radius startAngle:-M_PI/2 endAngle:M_PI*3/2 clockwise:true];
    circleLayer.path = path.CGPath;
    
    CABasicAnimation *checkAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    checkAnimation.duration = circleDuriation;
    checkAnimation.fromValue = @(0.0f);
    checkAnimation.toValue = @(1.0f);
    checkAnimation.delegate = self;
    [checkAnimation setValue:@"checkAnimation" forKey:@"animationName"];
    [circleLayer addAnimation:checkAnimation forKey:nil];
}

//对号
-(void)checkAnimation {
    CGFloat a = _animationLayer.bounds.size.width;
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(a*2.7/10,a*5.4/10)];
    [path addLineToPoint:CGPointMake(a*4.5/10,a*7/10)];
    [path addLineToPoint:CGPointMake(a*7.8/10,a*3.8/10)];
    
    CAShapeLayer *checkLayer = [CAShapeLayer layer];
    checkLayer.path = path.CGPath;
    checkLayer.fillColor = [UIColor clearColor].CGColor;
    checkLayer.strokeColor = PayColor.CGColor;
    checkLayer.lineWidth = lineWidth;
    checkLayer.lineCap = kCALineCapRound;
    checkLayer.lineJoin = kCALineJoinRound;
    [_animationLayer addSublayer:checkLayer];
    
    CABasicAnimation *checkAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    checkAnimation.duration = checkDuration;
    checkAnimation.fromValue = @(0.0f);
    checkAnimation.toValue = @(1.0f);
    checkAnimation.delegate = self;
    [checkAnimation setValue:@"checkAnimation" forKey:@"animationName"];
    [checkLayer addAnimation:checkAnimation forKey:nil];

}


@end
