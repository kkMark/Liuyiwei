//
//  BaseHttpRequest.m
//  Lywsale
//
//  Created by M on 2018/8/18.
//  Copyright © 2018年 黄锡凯. All rights reserved.
//

#import "BaseHttpRequest.h"
#import "BaseViewController.h"

@implementation BaseHttpRequest

- (instancetype)init {
    
    if (self = [super init]) {
        self.isLoading = YES;
    }
    
    return self;
}

/** 获取当前控制器 */
- (UIViewController *)getCurrentViewController {
    
    UIViewController *viewController = [UIApplication sharedApplication].keyWindow.rootViewController;
    while (1) {
        
        // 判断是否跳转过去的
        if (viewController.presentedViewController) {
            viewController = viewController.presentedViewController;
        }
        else break;
    }
    
    while ([viewController isKindOfClass:[UITabBarController class]] ||
           [viewController isKindOfClass:[UINavigationController class]])
    {
        // 判断是否tabBar
        if ([viewController isKindOfClass:[UITabBarController class]]) {
            viewController = ((UITabBarController *)viewController).selectedViewController;
        }
        
        // 判断是否导航
        if ([viewController isKindOfClass:[UINavigationController class]]) {
            viewController = ((UINavigationController *)viewController).visibleViewController;
        }
        
        // 判断是否跳转过去的
        if (viewController.presentedViewController) {
            viewController = viewController.presentedViewController;
        }
    }
    
    return viewController;
}

/** 获取IP地址 */
- (NSString *)getRequestUrl:(NSArray *)parArr {
    
    NSString *tempStr = @"";
    for (int i = 0; i < parArr.count; i++) {
        tempStr = [NSString stringWithFormat:@"%@/%@",tempStr,parArr[i]];
    }
    
    return tempStr;
}

/** 开始请求 */
- (void)requestMode:(RequestMode)mode success:(RequestSuccess)success failure:(RequestFailure)failure {
    
    if (mode == PostMode) {
        
        BaseViewController *viewController = (BaseViewController *)[self getCurrentViewController];
        if (self.isLoading) {
            [viewController showHudAnimated:YES];
        }
        
        NSData *jsonData = [NSJSONSerialization dataWithJSONObject:self.parameters options:NSJSONWritingPrettyPrinted error:nil];
        NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:self.urlString]];
        request.HTTPMethod = @"POST";
        request.HTTPBody = jsonData;
        request.timeoutInterval = 15;
        [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
        
        NSURLSession *session = [NSURLSession sharedSession];
        [[session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
            
            dispatch_async(dispatch_get_main_queue(), ^{
               
                if (error) failure(error);
                else {
                    
                    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
                    if (success) success(dict);
                }
            });
            
        }] resume];
    }
}

@end
