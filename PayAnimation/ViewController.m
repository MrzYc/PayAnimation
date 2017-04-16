//
//  ViewController.m
//  PayAnimation
//
//  Created by 赵永闯 on 2017/4/16.
//  Copyright © 2017年 zhaoyongchuang. All rights reserved.
//

#import "ViewController.h"
#import "PayLoadingView.h"
#import "PaySuccessView.h"


@interface ViewController ()

/** uiLabel */
@property (nonatomic, strong) UILabel *desLabel;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.title = @"支付宝付款动画";

    self.view.backgroundColor = [UIColor whiteColor];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"开始支付" style:UIBarButtonItemStylePlain target:self action:@selector(showLoadingAnimation)];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"支付完成" style:UIBarButtonItemStylePlain target:self action:@selector(showSuccessAnimation)];
    
    UILabel *desLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, [UIScreen mainScreen].bounds.size.height / 2 + 60, [UIScreen mainScreen].bounds.size.width, 30)];
    desLabel.textAlignment = NSTextAlignmentCenter;
    self.desLabel = desLabel;
    [self.view addSubview:desLabel];

}

-(void)showLoadingAnimation{
    
    self.desLabel.text = @"正在付款...";
    
    //隐藏支付完成动画
    [PaySuccessView hideIn:self.view];
    //显示支付中动画
    [PayLoadingView showIn:self.view];
}


-(void)showSuccessAnimation{
    
    //隐藏支付中成动画
    [PayLoadingView hideIn:self.view];
    //显示支付完成动画
    [PaySuccessView showIn:self.view];
    
    self.desLabel.text = @"付款完成";

}



@end
