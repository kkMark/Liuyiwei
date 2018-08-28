//
//  UIView+DKExtension.m
//  DKViewPage
//
//  Created by 庄槟豪 on 2016/11/8.
//  Copyright © 2016年 dankal. All rights reserved.
//

#import "UIView+DKExtension.h"

@implementation UIView (DKExtension)

- (CGSize)dk_size
{
    return self.frame.size;
}

- (void)setDk_size:(CGSize)dk_size
{
    CGRect frame = self.frame;
    frame.size = dk_size;
    self.frame = frame;
}

- (CGFloat)dk_width
{
    return self.frame.size.width;
}

- (CGFloat)dk_height
{
    return self.frame.size.height;
}

- (void)setDk_width:(CGFloat)dk_width
{
    CGRect frame = self.frame;
    frame.size.width = dk_width;
    self.frame = frame;
}

- (void)setDk_height:(CGFloat)dk_height
{
    CGRect frame = self.frame;
    frame.size.height = dk_height;
    self.frame = frame;
}

- (CGFloat)dk_x
{
    return self.frame.origin.x;
}

- (void)setDk_x:(CGFloat)dk_x
{
    CGRect frame = self.frame;
    frame.origin.x = dk_x;
    self.frame = frame;
}

- (CGFloat)dk_y
{
    return self.frame.origin.y;
}

- (void)setDk_y:(CGFloat)dk_y
{
    CGRect frame = self.frame;
    frame.origin.y = dk_y;
    self.frame = frame;
}

- (CGFloat)dk_centerX
{
    return self.center.x;
}

- (void)setDk_centerX:(CGFloat)dk_centerX
{
    CGPoint center = self.center;
    center.x = dk_centerX;
    self.center = center;
}

- (CGFloat)dk_centerY
{
    return self.center.y;
}

- (void)setDk_centerY:(CGFloat)dk_centerY
{
    CGPoint center = self.center;
    center.y = dk_centerY;
    self.center = center;
}

- (CGFloat)dk_right
{
    return CGRectGetMaxX(self.frame);
}

- (CGFloat)dk_bottom
{
    return CGRectGetMaxY(self.frame);
}

- (void)setDk_right:(CGFloat)dk_right
{
    self.dk_x = dk_right - self.dk_width;
}

- (void)setDk_bottom:(CGFloat)dk_bottom
{
    self.dk_y = dk_bottom - self.dk_height;
}

@end
