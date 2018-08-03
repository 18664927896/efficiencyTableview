//
//  SGShopThreeCell.m
//  efficiencyTableview
//
//  Created by admin on 2018/8/3.
//  Copyright © 2018年 admin. All rights reserved.
//

#import "SGShopThreeCell.h"

@interface SGShopThreeCell ()
@property (nonatomic, strong) UIButton *oneBnt;
@property (nonatomic, strong) UIButton *twoBnt;
@property (nonatomic, strong) UIButton *threeBnt;
@end

@implementation SGShopThreeCell

- (void)layoutIfNeeded{
    [super layoutIfNeeded];
}

#pragma mark - 添加子视图
- (void)addView{
    [super addView];

    [self.contentView addSubview:self.oneBnt];
    [self.contentView addSubview:self.twoBnt];
    [self.contentView addSubview:self.threeBnt];
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

- (UIButton *)twoBnt{
    if (!_twoBnt) {
        _twoBnt = [UIButton new];
        [_twoBnt setTitle:@"第二按钮" forState:UIControlStateNormal];
         _twoBnt.backgroundColor = [UIColor orangeColor];
        _twoBnt.titleLabel.font = [UIFont systemFontOfSize:14];
        _twoBnt.layer.cornerRadius = 5;
    }
    return _twoBnt;
}

- (UIButton *)threeBnt{
    if (!_threeBnt) {
        _threeBnt = [UIButton new];
        [_threeBnt setTitle:@"第三按钮" forState:UIControlStateNormal];
         _threeBnt.backgroundColor = [UIColor orangeColor];
        _threeBnt.titleLabel.font = [UIFont systemFontOfSize:14];
        _threeBnt.layer.cornerRadius = 5;
    }
    return _threeBnt;
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

    [_twoBnt mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.oneBnt.mas_left).offset(-5);
        make.bottom.mas_equalTo(self.contentView.mas_bottom).offset(-5);
        make.width.mas_equalTo(70);
        make.height.mas_equalTo(25);
    }];

    [_threeBnt mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.twoBnt.mas_left).offset(-5);
        make.bottom.mas_equalTo(self.contentView.mas_bottom).offset(-5);
        make.width.mas_equalTo(70);
        make.height.mas_equalTo(25);
    }];
}

@end
