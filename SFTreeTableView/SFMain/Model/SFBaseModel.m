//
//  SFBaseModel.m
//  SFTreeTableView
//
//  Created by apple on 2018/1/22.
//  Copyright © 2018年 com.easyhospital. All rights reserved.
//

#import "SFBaseModel.h"

@implementation SFBaseModel
- (instancetype)init{
    if (self = [super init]) {
        self.expand = NO;
        self.parentId = -1;
    }
    return self;
}
@end
