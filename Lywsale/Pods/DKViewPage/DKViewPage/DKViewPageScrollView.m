//
//  DKViewPageScrollView.m
//  DKViewPage
//
//  Created by 庄槟豪 on 2016/11/28.
//  Copyright © 2016年 cn.dankal. All rights reserved.
//

#import "DKViewPageScrollView.h"

#define kViewPageScrollUnEnableTag 1000

@implementation DKViewPageScrollView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.panGestureRecognizer.delegate = self;
    }
    return self;
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    self.panGestureRecognizer.delegate = self;
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer
{
    // 判断otherGestureRecognizer是不是系统pop手势
    if ([otherGestureRecognizer.view isKindOfClass:NSClassFromString(@"UILayoutContainerView")]) {
        // 判断系统手势的state是began还是fail，同时判断scrollView的位置是不是正好在最左边
        if (otherGestureRecognizer.state == UIGestureRecognizerStateBegan && self.contentOffset.x == 0) {
            return YES;
        }
    }
    return NO;
}

- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer
{
    UIPanGestureRecognizer *pan = (UIPanGestureRecognizer *)gestureRecognizer;
    CGPoint point = [pan translationInView:gestureRecognizer.view];
    if (point.x < 0 && self.contentOffset.x == self.contentSize.width - [UIScreen mainScreen].bounds.size.width) {
        return NO;
    }
    return YES;
}

- (BOOL)delaysContentTouches
{
    return NO;
}

- (BOOL)canCancelContentTouches
{
    return YES;
}

- (BOOL)touchesShouldCancelInContentView:(UIView *)view
{
    return view.tag != kViewPageScrollUnEnableTag;
}

@end
