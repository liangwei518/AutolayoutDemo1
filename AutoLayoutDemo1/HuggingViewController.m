//
//  IntrinsicSizeViewController.m
//  AutoLayoutDemo1
//
//  Created by liangwei on 15/12/6.
//  Copyright (c) 2015年 liangw. All rights reserved.
//

#import "HuggingViewController.h"
#import "IntrinsicView.h"
#import <Masonry/Masonry.h>

@interface HuggingViewController ()

@end

@implementation HuggingViewController

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"内容吸附优先级测试";
    [self layoutSubIntrinsicView];
}

#pragma mark - Private Methods
- (void)layoutSubIntrinsicView
{
    IntrinsicView *topView = [IntrinsicView new];
    topView.backgroundColor = [UIColor colorWithRed:.2 green:.4 blue:.6 alpha:1];
    [self.view addSubview:topView];
    [topView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.view);
        make.top.mas_equalTo(self.mas_topLayoutGuideBottom);//和导航栏底部对齐
    }];
    
    IntrinsicView *bottomView = [IntrinsicView new];
    bottomView.backgroundColor = [UIColor colorWithRed:.2 green:.4 blue:.6 alpha:1];
    [self.view addSubview:bottomView];
    [bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.view);
        make.top.mas_equalTo(topView.mas_bottom).offset(40);
        make.bottom.mas_equalTo(self.mas_bottomLayoutGuideBottom);//和页面底部对齐
    }];
    
    [topView setContentHuggingPriority:251 forAxis:UILayoutConstraintAxisVertical];
}

@end
