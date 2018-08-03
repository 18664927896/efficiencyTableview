//
//  SGShopBaseCell.m
//  efficiencyTableview
//
//  Created by admin on 2018/8/2.
//  Copyright © 2018年 admin. All rights reserved.
//

#import "SGShopBaseCell.h"
#import "UIImage+RoundedCorner.h"
#import "UIView+RoundedCorner.h"
@interface SGShopBaseCell ()
@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UILabel *descLabel;
@property (nonatomic, strong) UILabel *priceLabel;
@property (nonatomic, strong) UIImageView *shopImageView;
@end

@implementation SGShopBaseCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{

    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self addView];
        [self addConstrain];
    }
    return self;
}

-(void)layoutSubviews{
    [super layoutSubviews];

}

- (void)setNeedsLayout{
    [super setNeedsLayout];
}
- (void)layoutIfNeeded{
    [super layoutIfNeeded];

//    [self.nameLabel sg_addCornerColor:[UIColor greenColor]];
//    [self.descLabel sg_addCornerColor:[UIColor greenColor]];
//    [self.priceLabel sg_addCornerColor:[UIColor greenColor]];

}

- (void)refreshCell:(ShopModel*)model{
    self.shopModel = model;
    _nameLabel.text = model.name;
    _descLabel.text = model.des;
    _priceLabel.text = model.price;


    NSURL *url = [NSURL URLWithString:model.imagePath];

    __weak typeof (self)weakSelf = self;
    [_shopImageView sd_setImageWithURL:url completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
        CGSize size = CGSizeMake(40, 40);
//        weakSelf.shopImageView.image = image;
        [image imageAddCornerWithRadius:5 andSize:size callback:^(UIImage *image) {
            if (image==nil) {
                NSLog(@"没有图片");
            }else{
                weakSelf.shopImageView.image = image;
            }

        }];
    }];

}

#pragma mark - 添加子视图
- (void)addView{
    [self.contentView addSubview:self.shopImageView];
    [self.contentView addSubview:self.nameLabel];
    [self.contentView addSubview:self.descLabel];
    [self.contentView addSubview:self.priceLabel];
}

- (UIImageView *)shopImageView{
    if (!_shopImageView) {
        _shopImageView = [UIImageView new];
//        _shopImageView.layer.cornerRadius = 5;
//        _shopImageView.layer.masksToBounds = YES;

    }
    return _shopImageView;
}
- (UILabel *)nameLabel{
    if (!_nameLabel) {
        _nameLabel = [UILabel new];
        _nameLabel.font = [UIFont systemFontOfSize:15];

//        _nameLabel.layer.cornerRadius = 5;
//        _nameLabel.layer.masksToBounds = YES;
//        _nameLabel.backgroundColor = [UIColor greenColor];
    }
    return _nameLabel;
}

- (UILabel *)descLabel{
    if (!_descLabel) {
        _descLabel = [UILabel new];
        _descLabel.font = [UIFont systemFontOfSize:13];
//        _descLabel.layer.cornerRadius = 5;
//        _descLabel.layer.masksToBounds = YES;
//        _descLabel.backgroundColor = [UIColor greenColor];
    }
    return _descLabel;
}

- (UILabel *)priceLabel{
    if (!_priceLabel) {
        _priceLabel = [UILabel new];
        _priceLabel.font = [UIFont systemFontOfSize:13];
        _priceLabel.textColor = [UIColor redColor];
        _priceLabel.textAlignment = NSTextAlignmentRight;
//        _priceLabel.layer.cornerRadius = 5;
//        _priceLabel.layer.masksToBounds = YES;
//        _priceLabel.backgroundColor = [UIColor greenColor];
    }
    return _priceLabel;
}

#pragma mark - 添加约束
- (void)addConstrain{

    [self.shopImageView
     mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.contentView.mas_left).offset(15);
        make.top.mas_equalTo(self.contentView.mas_top).offset(10);
        make.height.mas_equalTo(40);
        make.width.mas_equalTo(40);
    }];

    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.shopImageView.mas_right).offset(5);
        make.top.mas_equalTo(self.shopImageView.mas_top);
        make.width.mas_equalTo(100);
        make.height.mas_equalTo(18);
    }];

    [self.descLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.shopImageView.mas_right).offset(5);
        make.bottom.mas_equalTo(self.shopImageView.mas_bottom);
        make.width.mas_equalTo(200);
        make.height.mas_equalTo(18);
    }];

    [self.priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.contentView.mas_right).offset(-15);
        make.top.mas_equalTo(self.nameLabel.mas_top);
        make.width.mas_equalTo(50);
        make.height.mas_equalTo(18);
    }];

}
@end
