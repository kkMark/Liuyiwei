//
//  DKViewPageOption.m
//  DKViewPage
//
//  Created by 庄槟豪 on 2016/11/8.
//  Copyright © 2016年 dankal. All rights reserved.
//

#import "DKViewPageOption.h"

@implementation DKViewPageOption

+ (instancetype)optionWithTitle:(NSString *)optionTitle viewController:(UIViewController *)optionViewController
{
    return [[self alloc] initWithTitle:optionTitle viewController:optionViewController];
}

- (instancetype)initWithTitle:(NSString *)optionTitle viewController:(UIViewController *)optionViewController
{
    self.optionTitle = optionTitle;
    self.optionViewController = optionViewController;
    self.optionViewController.title = optionTitle;

    return self;
}

#pragma mark - Deprecated

+ (instancetype)viewPageOptionWithTitle:(NSString *)optionTitle viewController:(UIViewController *)optionViewController
{
    return [[self alloc] initWithTitle:optionTitle viewController:optionViewController];
}

@end
