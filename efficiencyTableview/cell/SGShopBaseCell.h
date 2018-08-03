//
//  SGShopBaseCell.h
//  efficiencyTableview
//
//  Created by admin on 2018/8/2.
//  Copyright © 2018年 admin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ShopModel.h"

@interface SGShopBaseCell : UITableViewCell

@property(nonatomic, strong) ShopModel *shopModel;

- (void)refreshCell:(ShopModel*)model;

- (void)addView;

- (void)addConstrain;
@end
