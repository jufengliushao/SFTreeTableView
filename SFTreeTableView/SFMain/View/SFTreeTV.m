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
    NSArray *_parents;
    NSMutableArray *_datas;
    NSDictionary *_subDic;
}
@end

@implementation SFTreeTV
- (instancetype)initWithFrame:(CGRect)frame data:(__kindof NSArray <__kindof SFBaseModel *> *)datas subDatas:(__kindof NSDictionary *)subDatas{
    if (self = [super initWithFrame:frame]) {
        [self configureData:datas subDatas:subDatas];
        self.delegate = self;
        self.dataSource = self;
        [self registerClass:[SFListTableViewCell class] forCellReuseIdentifier:listCellID];
    }
    return self;
}

- (void)registCell:(__kindof NSArray <Class>*)cells{
  
}

#pragma mark - 数据处理
- (void)configureData:(__kindof NSArray <__kindof SFBaseModel *> *)datas subDatas:(__kindof NSDictionary *)subDatas{
    _parents = datas.copy;
    _datas = datas;
    _subDic = subDatas.copy;
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
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    NSString *key = [NSString stringWithFormat:@"%ld", [_parents indexOfObject:_datas[indexPath.row]]];
    if ([_subDic[key] count] < 1) {
        return;
    }
    SFListModel *listModel = _datas[indexPath.row];
    if (!listModel.expand) {
        listModel.expand = YES;
        NSArray *indexs = [self createIndex:indexPath key:key isInsert:YES];
        [self insertRowsAtIndexPaths:indexs withRowAnimation:UITableViewRowAnimationNone];
    }else{
        listModel.expand = NO;
        NSArray *indexs = [self createIndex:indexPath key:key isInsert:NO];
        [self deleteRowsAtIndexPaths:indexs withRowAnimation:UITableViewRowAnimationNone];
    }
}

#pragma mark - 功能类
- (__kindof NSArray <NSIndexPath *> *)createIndex:(NSIndexPath *)startIndex key:(NSString *)key isInsert:(BOOL)insert{
    NSArray *ar = _subDic[key];
    NSMutableArray *terminal = [NSMutableArray arrayWithCapacity:0];
    NSInteger start = startIndex.row;
    for (NSInteger i = 0; i < ar.count; i ++) {
        start ++;
        NSIndexPath *index = [NSIndexPath indexPathForRow:start inSection:startIndex.section];
        if (insert) {
            [self insertDatas:start datas:ar[i]];
        }else{
            [self removeDatas:startIndex.row + 1];
        }
        [terminal addObject:index];
    }
    return terminal;
}

- (void)insertDatas:(NSInteger)start datas:(SFListModel *)data{
    [_datas insertObject:data atIndex:start];
}

- (void)removeDatas:(NSInteger)poinst{
    [_datas removeObjectAtIndex:poinst];
}
@end
