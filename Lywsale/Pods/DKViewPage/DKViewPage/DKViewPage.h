//
//  DKViewPage.h
//  DKViewPage
//
//  Created by 庄槟豪 on 2016/11/8.
//  Copyright © 2016年 dankal. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DKViewPageOption.h"
#import "UIView+DKExtension.h"

/** 重复点击标题按钮的通知 */
UIKIT_EXTERN NSString *const DKTitleButtonDidRepeatClickNotification;

@interface DKViewPage : UIView

#pragma mark - Request Params
/** 分页选项 */
@property (nonatomic, strong) NSArray<DKViewPageOption *> *viewPageOptions;
/** 当前控制器 */
@property (nonatomic, strong) UIViewController *currentViewController;

#pragma mark - Customization
/** 标题栏的frame */
@property (nonatomic, assign) CGRect titleViewFrame;
/** 所有控制器view的frame */
@property (nonatomic, assign) CGRect controllerViewFrame;
/** 标题栏字体 */
@property (nonatomic, weak) UIFont *titleFont;
/** 标题栏字体普通状态颜色 */
@property (nonatomic, weak) UIColor *titleNormalColor;
/** 标题栏字体选中状态颜色 */
@property (nonatomic, weak) UIColor *titleSelectedColor;
/** 标题栏背景颜色 */
@property (nonatomic, weak) UIColor *titleViewBackgroundColor;
/** 标题栏底部指示器颜色 */
@property (nonatomic, weak) UIColor *indicatorColor;
/** 标题栏底部指示器高度 */
@property (nonatomic, assign) CGFloat indicatorHeight;

+ (instancetype)viewPageWithOptions:(NSArray<DKViewPageOption *> *)viewPageOptions currentViewController:(UIViewController *)viewController;
- (instancetype)initWithOptions:(NSArray<DKViewPageOption *> *)viewPageOptions currentViewController:(UIViewController *)viewController;
- (instancetype)initWithFrame:(CGRect)frame options:(NSArray<DKViewPageOption *> *)viewPageOptions currentViewController:(UIViewController *)viewController;

#pragma mark - Deprecated

+ (instancetype)viewPageWithOptions:(NSArray<DKViewPageOption *> *)viewPageOptions __attribute__((deprecated("Use viewPageWithOptions:currentViewController: instead")));
- (instancetype)initWithOptions:(NSArray<DKViewPageOption *> *)viewPageOptions __attribute__((deprecated("Use initWithOptions:currentViewController: instead")));
- (instancetype)initWithFrame:(CGRect)frame options:(NSArray<DKViewPageOption *> *)viewPageOptions __attribute__((deprecated("Use initWithFrame:options:currentViewController: instead")));

@end
