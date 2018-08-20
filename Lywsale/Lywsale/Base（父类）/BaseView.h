//
//  BaseView.h
//  Lywsale
//
//  Created by M on 2018/8/18.
//  Copyright © 2018年 黄锡凯. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseView : UIView

/// 状态栏高度
@property (nonatomic, assign) CGFloat statusBarHeight;

- (void)setupSubviews;

@end
