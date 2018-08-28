//
//  DKViewPageManager.m
//  DKViewPage
//
//  Created by 庄槟豪 on 2016/11/8.
//  Copyright © 2016年 cn.dankal. All rights reserved.
//

#import "DKViewPageManager.h"

#define DKScreenH [UIScreen mainScreen].bounds.size.height
#define DKScreenW [UIScreen mainScreen].bounds.size.width

@interface DKViewPageManager ()
@property (nonatomic, strong) DKViewPageManager *manager;
@end

@implementation DKViewPageManager

static DKViewPageManager *_instance;

+ (id)allocWithZone:(struct _NSZone *)zone
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [super allocWithZone:zone];
    });
    
    return _instance;
}

+ (instancetype)sharedInstance
{
    if (!_instance) {
        _instance = [[DKViewPageManager alloc] init];
        // Base
        _instance.indicatorHeight = -1;
    }
    
    return _instance;
}

#pragma mark - Getter && Setter

- (CGRect)viewPageFrame
{
    if (_viewPageFrame.size.height || _viewPageFrame.size.width) {
        if (_viewPageFrame.size.height > DKScreenH) {
            _viewPageFrame.size.height = DKScreenH;
        }
        if (_viewPageFrame.size.width > DKScreenW) {
            _viewPageFrame.size.width = DKScreenW;
        }
        if (_viewPageFrame.origin.y + _viewPageFrame.size.height > DKScreenH) {
            _viewPageFrame.size.height = DKScreenH - _viewPageFrame.origin.y;
        }
        return _viewPageFrame;
    } else {
        CGFloat viewPageY = 20;
        return CGRectMake(0, viewPageY, DKScreenW, DKScreenH - viewPageY);
    }
}

- (CGRect)titleViewFrame
{
    if (_titleViewFrame.size.height || _titleViewFrame.size.width) {
        if (_titleViewFrame.size.height > DKScreenH) {
            _titleViewFrame.size.height = DKScreenH;
        }
        if (_titleViewFrame.size.width > DKScreenW) {
            _titleViewFrame.size.width = DKScreenW;
        }
        return _titleViewFrame;
    } else {
        CGFloat titleViewW = self.viewPageFrame.size.width;
        CGFloat titleViewH = 35;
        
        return CGRectMake(0, 0, titleViewW, titleViewH);
    }
}

- (CGRect)controllerViewFrame
{
    if (_controllerViewFrame.size.height || _controllerViewFrame.size.width) {
        if (_controllerViewFrame.size.height > DKScreenH) {
            _controllerViewFrame.size.height = DKScreenH;
        }
        if (_controllerViewFrame.size.width > DKScreenW) {
            _controllerViewFrame.size.width = DKScreenW;
        }
        if (self.titleViewFrame.origin.y + _controllerViewFrame.size.height > DKScreenH) {
            _controllerViewFrame.size.height = DKScreenH - self.titleViewFrame.origin.y;
        }
        
        return _controllerViewFrame;
    } else {
        CGFloat controllerViewX = 0;
        CGFloat controllerViewY = self.titleViewFrame.origin.y;
        CGFloat controllerViewW = self.titleViewFrame.size.width;
        CGFloat controllerViewH = self.viewPageFrame.size.height - self.titleViewFrame.origin.y;
        
        return CGRectMake(controllerViewX, controllerViewY, controllerViewW, controllerViewH);
    }
}

- (UIFont *)titleFont
{
    return _titleFont ? _titleFont : [UIFont systemFontOfSize:14];
}

- (UIColor *)titleNormalColor
{
    return _titleNormalColor ? _titleNormalColor : [UIColor blackColor];
}

- (UIColor *)titleSelectedColor
{
    return _titleSelectedColor ? _titleSelectedColor : [UIColor redColor];
}

- (UIColor *)titleViewBackgroundColor
{
    return _titleViewBackgroundColor ? _titleViewBackgroundColor : [[UIColor whiteColor] colorWithAlphaComponent:0.9];
}

- (UIColor *)indicatorColor
{
    return _indicatorColor ? _indicatorColor : [UIColor redColor];
}

- (CGFloat)indicatorHeight
{
    return _indicatorHeight > -1 ? _indicatorHeight : 1;
}

@end
