//
//  CellModel.h
//  AutoLayoutDemo1
//
//  Created by liangwei on 15/12/10.
//  Copyright (c) 2015年 liangw. All rights reserved.
//

#import <Foundation/Foundation.h>
@import UIKit;

@interface CellModel : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *company;
@property (nonatomic, copy) NSString *content;
@property (nonatomic, assign) CGFloat cacheHeight;

/**
 *  构造一定数量的‘CellModel’
 *
 *  @return 构造好的模型数组
 */
+ (NSArray *)constructLayoutModels;

@end
