//
//  SFBaseModel.h
//  SFTreeTableView
//
//  Created by apple on 2018/1/22.
//  Copyright © 2018年 com.easyhospital. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SFBaseModel : NSObject

@property (nonatomic, assign) NSInteger parentId; //父节点的id，如果为-1表示该节点为根节点
@property (nonatomic, assign) NSInteger nodeId; //本节点的ids
@property (nonatomic, assign) BOOL expand;//该节点是否处于展开状态

@end
