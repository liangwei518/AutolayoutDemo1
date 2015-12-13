//
//  CodeTableViewController.m
//  AutoLayoutDemo1
//
//  Created by liangwei on 15/12/10.
//  Copyright (c) 2015年 liangw. All rights reserved.
//

#import "CodeTableViewController.h"
#import "CodeLayoutCell.h"
#import "CellModel.h"

@interface CodeTableViewController ()

@property (nonatomic, copy) NSArray *dataSourceArray;

@end

@implementation CodeTableViewController

static NSString *const kCellIdentifier = @"cell";

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"纯代码布局cell";
    [self.tableView registerClass:[CodeLayoutCell class] forCellReuseIdentifier:kCellIdentifier];
    [self.tableView setEstimatedRowHeight:44];
    [self setupDataSource];
}

#pragma mark - Custom Methods
- (void)setupDataSource
{
    self.dataSourceArray = [CellModel constructLayoutModels];
    [self.tableView reloadData];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_dataSourceArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
     CodeLayoutCell *cell = [tableView dequeueReusableCellWithIdentifier:kCellIdentifier forIndexPath:indexPath];
    CellModel *model = _dataSourceArray[indexPath.row];
    [cell setNewCellModel:model];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static CodeLayoutCell *singleCell = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        singleCell = [tableView dequeueReusableCellWithIdentifier:kCellIdentifier];
    });
    
    CellModel *model = _dataSourceArray[indexPath.row];
    if (model.cacheHeight != 0) {
        return model.cacheHeight;
    }
    [singleCell layoutIfNeeded];
    [singleCell setNewCellModel:model];
    CGSize size = [singleCell.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize];
    model.cacheHeight = size.height + 1;//cell和cell.contentView的高低相差1
    
    return model.cacheHeight;
}

@end
