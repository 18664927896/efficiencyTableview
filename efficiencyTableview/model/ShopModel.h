//
//  ShopModel.h
//  efficiencyTableview
//
//  Created by admin on 2018/7/31.
//  Copyright © 2018年 admin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ShopModel : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *des;
@property (nonatomic, copy) NSString *price;
@property (nonatomic, copy) NSString *imagePath;
@property (nonatomic) NSInteger type;
@property (nonatomic) CGFloat rowHeight;


@end
