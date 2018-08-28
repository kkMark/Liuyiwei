//
//  DKTitleButton.m
//  DKViewPage
//
//  Created by 庄槟豪 on 2016/11/8.
//  Copyright © 2016年 dankal. All rights reserved.
//

#import "DKTitleButton.h"
#import "DKViewPageManager.h"

@implementation DKTitleButton

static NSString *const kKeyPathTitleNormalColor = @"titleNormalColor";
static NSString *const kKeyPathTitleSelectedColor = @"titleSelectedColor";
static NSString *const kKeyPathTitleFont = @"titleFont";

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        // 添加观察者
        [self setupObserver];
        
        [self setTitleColor:DKViewPageShareManager.titleNormalColor forState:UIControlStateNormal];
        [self setTitleColor:DKViewPageShareManager.titleSelectedColor forState:UIControlStateSelected];
        self.titleLabel.font = DKViewPageShareManager.titleFont;
    }
    return self;
}

- (void)setHighlighted:(BOOL)highlighted
{
    // 取消高亮效果
}

/** 添加观察者 */
- (void)setupObserver
{
    KAddObserver(kKeyPathTitleNormalColor)
    KAddObserver(kKeyPathTitleSelectedColor)
    KAddObserver(kKeyPathTitleFont)
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context
{
    if ([keyPath isEqualToString:kKeyPathTitleNormalColor]) {
        [self setTitleColor:DKViewPageShareManager.titleNormalColor forState:UIControlStateNormal];
    } else if ([keyPath isEqualToString:kKeyPathTitleSelectedColor]) {
        [self setTitleColor:DKViewPageShareManager.titleSelectedColor forState:UIControlStateSelected];
    } else if ([keyPath isEqualToString:kKeyPathTitleFont]) {
        self.titleLabel.font = DKViewPageShareManager.titleFont;
    }
}

- (void)dealloc
{
    KRemoveObserver(kKeyPathTitleNormalColor)
    KRemoveObserver(kKeyPathTitleSelectedColor)
    KRemoveObserver(kKeyPathTitleFont)
}

@end
