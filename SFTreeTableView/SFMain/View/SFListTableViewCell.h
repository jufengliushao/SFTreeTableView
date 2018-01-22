//
//  SFListTableViewCell.h
//  SFTreeTableView
//
//  Created by apple on 2018/1/22.
//  Copyright © 2018年 com.easyhospital. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SFListModel.h"
@interface SFListTableViewCell : UITableViewCell

@property (nonatomic, strong)  UILabel *titleLabel; // 标题label
@property (nonatomic, strong)  UILabel *descLabel; // 描述label
- (void)configureData:(SFListModel *)model;
@end
