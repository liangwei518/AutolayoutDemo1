//
//  CellModel.m
//  AutoLayoutDemo1
//
//  Created by liangwei on 15/12/10.
//  Copyright (c) 2015年 liangw. All rights reserved.
//

#import "CellModel.h"

@implementation CellModel

+ (NSArray *)constructLayoutModels
{
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"SampleData" ofType:@"plist"];
    NSArray *array = [NSArray arrayWithContentsOfFile:filePath];
    
    NSMutableArray *modelsArray = [NSMutableArray array];
    for (NSDictionary *dic in array) {
        CellModel *model = [CellModel new];
        model.company = dic[@"sampleCompany"];
        model.name = dic[@"sampleName"];
        model.content = dic[@"simpleContent"];
        [modelsArray addObject:model];
    }
    
    return modelsArray;
}

@end
