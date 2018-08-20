//
//  BaseView.m
//  Lywsale
//
//  Created by M on 2018/8/18.
//  Copyright © 2018年 黄锡凯. All rights reserved.
//

#import "BaseView.h"

@implementation BaseView

- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        
        self.backgroundColor = [UIColor whiteColor];
        // 状态栏高度
        self.statusBarHeight = [[UIApplication sharedApplication] statusBarFrame].size.height;
        // 初始化方法
        [self setupSubviews];
    }
    
    return self;
}

- (void)setupSubviews {
    
    
}

@end
