//
//  UIImage+RoundedCorner.h
//  efficiencyTableview
//
//  Created by admin on 2018/7/31.
//  Copyright © 2018年 admin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (RoundedCorner)

- (void)imageAddCornerWithRadius:(CGFloat)radius andSize:(CGSize)size callback:(void(^)(UIImage* image))callback;
@end
