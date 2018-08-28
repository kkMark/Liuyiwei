//
//  DKViewPageOption.h
//  DKViewPage
//
//  Created by 庄槟豪 on 2016/11/8.
//  Copyright © 2016年 dankal. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DKViewPageOption : NSObject

/** 选项标题 */
@property (nonatomic, copy) NSString *optionTitle;
/** 对应的控制器 */
@property (nonatomic, strong) UIViewController *optionViewController;

+ (instancetype)optionWithTitle:(NSString *)optionTitle viewController:(UIViewController *)optionViewController;
- (instancetype)initWithTitle:(NSString *)optionTitle viewController:(UIViewController *)optionViewController;

#pragma mark - Deprecated

+ (instancetype)viewPageOptionWithTitle:(NSString *)optionTitle viewController:(UIViewController *)optionViewController __attribute__((deprecated("Use optionWithTitle:viewController: instead")));

@end
