//
//  CodeLayoutCell.m
//  AutoLayoutDemo1
//
//  Created by liangwei on 15/12/10.
//  Copyright (c) 2015年 liangw. All rights reserved.
//

#import "CodeLayoutCell.h"
#import "CellModel.h"
#import <Masonry/Masonry.h>

@interface CodeLayoutCell ()

@property (nonatomic, strong) UIImageView *cellImageView;
@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UILabel *contentLabel;
@property (nonatomic, strong) UILabel *companyLabel;

@end

@implementation CodeLayoutCell

- (UILabel *)createLabel:(NSString *)content
                   color:(UIColor *)color
                    font:(UIFont *)font
                 aliment:(NSTextAlignment)aliment
{
    UILabel *label = [[UILabel alloc] init];
    label.backgroundColor = [UIColor clearColor];
    label.text = content;
    label.textColor = color;
    label.font = font;
    label.lineBreakMode = NSLineBreakByTruncatingTail;
    label.textAlignment = aliment;
    return label;
}


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _cellImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"cellImage"]];
        [self.contentView addSubview:_cellImageView];
        //图片距左边距离为10，上下居中
        [_cellImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.contentView).offset(10);
            make.centerY.mas_equalTo(self.contentView);
            make.top.mas_greaterThanOrEqualTo(self.contentView).offset(10);
            make.bottom.mas_lessThanOrEqualTo(self.contentView).offset(-10);
        }];
        //标题Label,一行显示
        _nameLabel = [self createLabel:@""
                                 color:[UIColor blackColor]
                                  font:[UIFont systemFontOfSize:14]
                               aliment:NSTextAlignmentLeft];
        [self.contentView addSubview:_nameLabel];
        [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.cellImageView.mas_right).offset(6);
            make.right.mas_lessThanOrEqualTo(self.contentView).offset(-10);
            make.top.mas_equalTo(self.contentView).offset(10);
        }];
        //内容label,多行显示
        _contentLabel = [self createLabel:@""
                                 color:[UIColor blackColor]
                                  font:[UIFont systemFontOfSize:12]
                               aliment:NSTextAlignmentLeft];
        _contentLabel.numberOfLines = 0;
        [self.contentView addSubview:_contentLabel];
        [_contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.nameLabel);
            make.top.mas_equalTo(self.nameLabel.mas_bottom).offset(4);
        }];
        //标题Label,一行显示
        _companyLabel = [self createLabel:@""
                                 color:[UIColor blackColor]
                                  font:[UIFont systemFontOfSize:10]
                               aliment:NSTextAlignmentLeft];
        [self.contentView addSubview:_companyLabel];
        [_companyLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.contentLabel);
            make.right.mas_lessThanOrEqualTo(self.contentView).offset(-10);
            make.top.mas_equalTo(self.contentLabel.mas_bottom).offset(6);
            make.bottom.mas_equalTo(self.contentView).offset(-10);
        }];
        
        [_nameLabel setContentHuggingPriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisVertical];
        [_companyLabel setContentHuggingPriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisVertical];
        [_contentLabel setContentHuggingPriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisVertical];
    }
    
    return self;
}

- (void)setNewCellModel:(CellModel *)newModel
{
    _nameLabel.text = newModel.name;
    _contentLabel.text = newModel.content;
    _companyLabel.text = newModel.company;
}

- (void)layoutSubviews
{
    _contentLabel.preferredMaxLayoutWidth = CGRectGetWidth(self.contentView.frame) - 128 - 10 - 6;
    [super layoutSubviews];
}

@end
