//
//  CompressionViewController.m
//  AutoLayoutDemo1
//
//  Created by liangwei on 15/12/6.
//  Copyright (c) 2015年 liangw. All rights reserved.
//

#import "CompressionViewController.h"
#import <Masonry/Masonry.h>

@interface CompressionViewController ()

@end

@implementation CompressionViewController

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"压缩阻力优先级测试";
    [self layoutSubLabels];
}

#pragma mark - Private Method
- (void)layoutSubLabels
{
    UILabel *leftLabel = [[UILabel alloc] init];
    leftLabel.backgroundColor = [UIColor colorWithRed:.2 green:.3 blue:.4 alpha:1.0];
    leftLabel.numberOfLines = 1;
    leftLabel.textColor = [UIColor whiteColor];
    leftLabel.textAlignment = NSTextAlignmentLeft;
    leftLabel.font = [UIFont systemFontOfSize:16];
    [self.view addSubview:leftLabel];
    
    UILabel *rightLabel = [[UILabel alloc] init];
    rightLabel.backgroundColor = [UIColor colorWithRed:.4 green:.3 blue:.2 alpha:1.0];
    rightLabel.numberOfLines = 1;
    rightLabel.textColor = [UIColor whiteColor];
    rightLabel.textAlignment = NSTextAlignmentLeft;
    rightLabel.font = [UIFont systemFontOfSize:16];
    [self.view addSubview:rightLabel];
    
    leftLabel.text = @"压缩阻力优先级测试";
    rightLabel.text = @"压缩阻力优先级测试";
    
    [leftLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        //左边和父视图间隔固定为10
        make.left.mas_equalTo(self.view).offset(10);
        make.top.mas_equalTo(80);//随意设定的值
    }];
    
    [rightLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(leftLabel);
        //和leftLabel的右边间距固定为20
        make.left.mas_equalTo(leftLabel.mas_right).offset(20);
        //这里注意是‘lessThanOrEqualTo’，也就是‘rightLabel’的右边界
        //和父视图的间距至少为10，内容少时，间距自动调大
        make.right.mas_lessThanOrEqualTo(self.view).offset(-10);
    }];
    
    [rightLabel setContentCompressionResistancePriority:751 forAxis:UILayoutConstraintAxisHorizontal];
}



@end
