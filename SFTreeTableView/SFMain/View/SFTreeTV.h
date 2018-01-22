//
//  SFTreeTV.h
//  SFTreeTableView
//
//  Created by apple on 2018/1/22.
//  Copyright © 2018年 com.easyhospital. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SFListModel.h"
@interface SFTreeTV : UITableView
- (instancetype)initWithFrame:(CGRect)frame data:(__kindof NSArray <__kindof SFBaseModel *> *)datas subDatas:(__kindof NSDictionary *)subDatas;
@end
