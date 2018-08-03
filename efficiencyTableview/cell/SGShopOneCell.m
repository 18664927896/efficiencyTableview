//
//  SGShopOneCell.m
//  efficiencyTableview
//
//  Created by admin on 2018/8/3.
//  Copyright © 2018年 admin. All rights reserved.
//

#import "SGShopOneCell.h"

@interface SGShopOneCell ()
@property (nonatomic, strong) UIButton *oneBnt;
@end

@implementation SGShopOneCell

- (void)layoutIfNeeded{
    [super layoutIfNeeded];
}

#pragma mark - 添加子视图
- (void)addView{
    [super addView];
    [self.contentView addSubview:self.oneBnt];
}

- (UIButton *)oneBnt{
    if (!_oneBnt) {
        _oneBnt = [UIButton new];
        [_oneBnt setTitle:@"第一按钮" forState:UIControlStateNormal];
        _oneBnt.backgroundColor = [UIColor orangeColor];
        _oneBnt.titleLabel.font = [UIFont systemFontOfSize:14];
        _oneBnt.layer.cornerRadius = 5;
    }
    return _oneBnt;
}

#pragma mark - 添加约束
- (void)addConstrain{
    [super addConstrain];

    [_oneBnt mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.contentView.mas_right).offset(-12);
        make.bottom.mas_equalTo(self.contentView.mas_bottom).offset(-5);
        make.width.mas_equalTo(70);
        make.height.mas_equalTo(25);
    }];



}

@end
