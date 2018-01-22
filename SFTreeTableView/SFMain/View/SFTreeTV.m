//
//  SFTreeTV.m
//  SFTreeTableView
//
//  Created by apple on 2018/1/22.
//  Copyright © 2018年 com.easyhospital. All rights reserved.
//

#import "SFTreeTV.h"
#import "SFListTableViewCell.h"

NSString *const listCellID = @"sf_listCellID";

@interface SFTreeTV()<UITableViewDelegate, UITableViewDataSource>{
    NSMutableArray *_datas;
}
@end

@implementation SFTreeTV
- (instancetype)initWithFrame:(CGRect)frame data:(__kindof NSArray <__kindof SFBaseModel *> *)datas{
    if (self = [super initWithFrame:frame]) {
        [self configureData:datas];
        self.delegate = self;
        self.dataSource = self;
        [self registerClass:[SFListTableViewCell class] forCellReuseIdentifier:listCellID];
    }
    return self;
}

- (void)registCell:(__kindof NSArray <Class>*)cells{
  
}

#pragma mark - 数据处理
- (void)configureData:(__kindof NSArray <__kindof SFBaseModel *> *)datas{
    _datas = datas;
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _datas.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    SFListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:listCellID forIndexPath:indexPath];
    [cell configureData:_datas[indexPath.row]];
    return cell;
}

#pragma mark - UITableViewDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 66;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    SFListModel *listModel = _datas[indexPath.row];
    if (!listModel.expand) {
        SFListModel *model = [[SFListModel alloc] init];
        model.title = @"二级菜单";
        model.desc = @"二级菜单描述";
        model.parentId = indexPath.row;
        listModel.expand = YES;
        [_datas insertObject:model atIndex:indexPath.row + 1];
        [self insertRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:indexPath.row + 1 inSection:indexPath.section]] withRowAnimation:UITableViewRowAnimationNone];
    }else{
        listModel.expand = NO;
        [_datas removeObjectAtIndex:indexPath.row + 1];
        [self deleteRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:indexPath.row + 1 inSection:indexPath.section]] withRowAnimation:UITableViewRowAnimationNone];
    }
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}
@end
