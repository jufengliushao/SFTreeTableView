//
//  SFListTableViewCell.m
//  SFTreeTableView
//
//  Created by apple on 2018/1/22.
//  Copyright © 2018年 com.easyhospital. All rights reserved.
//

#import "SFListTableViewCell.h"

@implementation SFListTableViewCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)drawRect:(CGRect)rect{
    [self.descLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(-10);
        make.trailing.mas_equalTo(-10);
    }];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.mas_equalTo(10);
        make.bottom.mas_equalTo(-10);
    }];
    [super drawRect:rect];
}

#pragma mark - 数据处理
- (void)configureData:(SFListModel *)model{
    self.titleLabel.text = model.title;
    self.descLabel.text = model.desc;
}

#pragma mark - 懒加载
- (UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        [self.contentView addSubview:_titleLabel];
    }
    return _titleLabel;
}

- (UILabel *)descLabel{
    if (!_descLabel) {
        _descLabel = [[UILabel alloc] init];
        [self.contentView addSubview:_descLabel];
    }
    return _descLabel;
}
@end
