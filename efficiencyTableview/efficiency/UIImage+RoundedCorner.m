//
//  UIImage+RoundedCorner.m
//  efficiencyTableview
//
//  Created by admin on 2018/7/31.
//  Copyright © 2018年 admin. All rights reserved.
//

#import "UIImage+RoundedCorner.h"

@implementation UIImage (RoundedCorner)
- (void)imageAddCornerWithRadius:(CGFloat)radius andSize:(CGSize)size callback:(void (^)(UIImage *))callback{


    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        //图片绘制在子线程，UI刷新在主线程进行
        CGRect rect = CGRectMake(0, 0, size.width, size.height);
        UIGraphicsBeginImageContextWithOptions(size, NO, [UIScreen mainScreen].scale);
        CGContextRef ctx = UIGraphicsGetCurrentContext();
        UIBezierPath * path = [UIBezierPath bezierPathWithRoundedRect:rect byRoundingCorners:UIRectCornerAllCorners cornerRadii:CGSizeMake(radius, radius)];
        CGContextAddPath(ctx,path.CGPath);
        CGContextClip(ctx);
        [self drawInRect:rect];
        CGContextDrawPath(ctx, kCGPathFillStroke);
        UIImage * newImage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        //回到主线程
        dispatch_async(dispatch_get_main_queue(), ^{
            if (newImage) {
                callback(newImage);
            }else{
                callback(nil);
            }
        });
    });

}
@end
