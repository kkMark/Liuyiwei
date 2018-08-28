//
//  TaskPanelView.m
//  Lywsale
//
//  Created by M on 2018/8/28.
//  Copyright © 2018年 黄锡凯. All rights reserved.
//

#import "TaskPanelView.h"
#import "BaseHttpRequest.h"
#import <DKViewPage.h>

@interface TaskPanelView ()

@property (nonatomic, strong) DKViewPage *viewPage;

@end
@implementation TaskPanelView
@synthesize viewPage;

- (void)setupSubviews {
    
    [self.viewPage setBackgroundColor:kPageBgColor];
}

- (DKViewPage *)viewPage {
    
    if (!viewPage) {
        
        NSArray *titles = @[@"动销任务", @"日常任务", @"学习任务"];
        NSArray *vcNames = @[@"UIViewController", @"UIViewController", @"UIViewController"];
        NSMutableArray *options = [NSMutableArray array];
        for (int i = 0; i < titles.count; i++) {
            
            DKViewPageOption *option = [DKViewPageOption optionWithTitle:titles[i] viewController:[NSClassFromString(vcNames[i]) new]];
            [options addObject:option];
        }
        
        UIViewController *vc = [[BaseHttpRequest new] getCurrentViewController];
        viewPage = [[DKViewPage alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, self.height) options:options currentViewController:vc];
        viewPage.titleSelectedColor = [UIColor whiteColor];
        viewPage.titleViewBackgroundColor = kMainColor;
        viewPage.titleNormalColor = kMainTextColor;
        viewPage.titleFont = [UIFont systemFontOfSize:14];
        viewPage.indicatorColor =  [UIColor whiteColor];;
        viewPage.indicatorHeight = 0;
        viewPage.titleViewFrame = CGRectMake(0, 0, ScreenWidth, 45);
        viewPage.controllerViewFrame = CGRectMake(0, 0, ScreenWidth, viewPage.height);
        [self addSubview:viewPage];
    }
    
    return viewPage;
}

@end
