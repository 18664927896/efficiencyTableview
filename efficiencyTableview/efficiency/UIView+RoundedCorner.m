//
//  UIView+RoundedCorner.m
//  efficiencyTableview
//
//  Created by admin on 2018/7/31.
//  Copyright © 2018年 admin. All rights reserved.
//

#import "UIView+RoundedCorner.h"

@implementation UIView (RoundedCorner)


//添加背景
-(void)sg_addCornerColor:(UIColor *)color{


    UIImageView *imageView = [self viewWithTag:10001];
    if (imageView==nil) {//如果已经有了倒角则不需要再次添加
        imageView = [[UIImageView alloc] initWithFrame:self.bounds];
        imageView.tag = 10001;
        [self insertSubview:imageView atIndex:0];
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(self.mas_right);
            make.left.mas_equalTo(self.mas_left);
            make.top.mas_equalTo(self.mas_top);
            make.bottom.mas_equalTo(self.mas_bottom);
        }];
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            //图片绘制在子线程，UI刷新在主线程进行
            UIImage *image = [self sg_createImageColor:color];
            dispatch_async(dispatch_get_main_queue(), ^{
                imageView.image = image;
            });
        });
    }else{

        if (imageView.frame.size.height!=self.frame.size.height || imageView.frame.size.width!=self.frame.size.width) {

            dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
                //图片绘制在子线程，UI刷新在主线程进行
                UIImage *image = [self sg_createImageColor:color];
                dispatch_async(dispatch_get_main_queue(), ^{
                    imageView.image = image;
                });
            });
        }
    }




}

//绘制图片
-(UIImage*)sg_createImageColor:(UIColor *)color{
    //开启图形上下文
    UIGraphicsBeginImageContextWithOptions(self.frame.size, NO, 0);
    //绘制颜色区域
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:self.bounds cornerRadius:5];
    //    path.lineWidth = 10;
    [color setFill];
    [path fill];
    //从图形上下文获取图片
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    //关闭图形上下文
    UIGraphicsEndImageContext();
    return newImage;
}

@end
