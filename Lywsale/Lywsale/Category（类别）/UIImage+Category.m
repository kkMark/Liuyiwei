
//
//  UIImage+Category.m
//  Lywsale
//
//  Created by M on 2018/9/4.
//  Copyright © 2018年 黄锡凯. All rights reserved.
//

#import "UIImage+Category.h"

@implementation UIImage (Category)

- (UIImage *)imageChangeColor:(UIColor *)color {
    
    UIGraphicsBeginImageContextWithOptions(self.size, NO, 0.0f);
    [color setFill];
    
    CGRect bounds = CGRectMake(0, 0, self.size.width, self.size.height);
    UIRectFill(bounds);
    
    // 绘制一次
    [self drawInRect:bounds blendMode:kCGBlendModeOverlay alpha:1.0f];
    // 再绘制一次
    [self drawInRect:bounds blendMode:kCGBlendModeDestinationIn alpha:1.0f];
    
    // 获取图片
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return img;
}

@end
