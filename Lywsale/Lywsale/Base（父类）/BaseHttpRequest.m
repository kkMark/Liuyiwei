//
//  BaseHttpRequest.m
//  Lywsale
//
//  Created by M on 2018/8/18.
//  Copyright © 2018年 黄锡凯. All rights reserved.
//

#import "BaseHttpRequest.h"
#import "BaseViewController.h"
#import <AFNetworking.h>

@implementation BaseHttpRequest

- (instancetype)init {
    
    if (self = [super init]) {
        self.isLoading = YES;
        self.port = @"28084";
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
    
    NSString *tempStr = [NSString stringWithFormat:@"http://39.108.140.12:%@", self.port];
    for (int i = 0; i < parArr.count; i++) {
        tempStr = [NSString stringWithFormat:@"%@/%@", tempStr, parArr[i]];
    }
    
    return tempStr;
}

/** 开始请求 */
- (void)requestMode:(RequestMode)mode success:(RequestSuccess)success failure:(RequestFailure)failure {
    
    BaseViewController *viewController = (BaseViewController *)[self getCurrentViewController];
    if (self.isLoading) {
        [viewController showHudAnimated:YES];
    }
    
    NSLog(@"urlString = %@", self.urlString);
    NSLog(@"parameters = %@", self.parameters);
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:self.urlString]];
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];

    if (mode == PostMode) {
    
        NSData *jsonData = [NSJSONSerialization dataWithJSONObject:self.parameters options:NSJSONWritingPrettyPrinted error:nil];
        request.HTTPMethod = @"POST";
        request.HTTPBody = jsonData;
        request.timeoutInterval = 15;
    }
    
    if ([GetUserDefault(Access_Token) length] != 0) {
        NSString *token = [NSString stringWithFormat:@"bearer %@",GetUserDefault(Access_Token)];
        [request setValue:token forHTTPHeaderField:@"authorization"];
    }
    
    NSURLSession *session = [NSURLSession sharedSession];
    [[session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error)
    {
        dispatch_async(dispatch_get_main_queue(), ^{
            
            [viewController hideHudAnimated];
            
            if (failure) {
                failure(error);
            }
            else if (success) {
                
                NSDictionary *dict;
                if (data != nil) {
                    
                    dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
                    NSLog(@"%@", dict);
                }
                
                success(dict);
            }
        });
        
    }] resume];
}

- (void)requestAFMode:(RequestMode)mode success:(RequestSuccess)success failure:(RequestFailure)failure {
    
    BaseViewController *viewController = (BaseViewController *)[self getCurrentViewController];
    if (self.isLoading) {
        [viewController showHudAnimated:YES];
    }
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/plain", @"text/javascript", @"text/json", @"text/html",@"application/xml", nil];
    [manager.requestSerializer willChangeValueForKey:@"timeoutInterval"];
    manager.requestSerializer.timeoutInterval = 15;
    [manager.requestSerializer didChangeValueForKey:@"timeoutInterval"];
    manager.requestSerializer = [[AFJSONRequestSerializer alloc]init];
    
    if ([GetUserDefault(Access_Token) length] != 0) {
        
        NSString *token = [NSString stringWithFormat:@"bearer %@",GetUserDefault(Access_Token)];
        [manager.requestSerializer setValue:token forHTTPHeaderField:@"authorization"];
        
        NSLog(@"%@", token);
    }
    
    DebugLog(@"================ requestURL =====================\n %@\n%@", self.urlString, self.parameters);

    if (mode == GetMode) {
        
        [manager GET:self.urlString parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            
            DebugLog(@"\n=========== response ===========\n%@\n", responseObject);
            
            if (success){
                success(responseObject);
            };
            
            [viewController hideHudAnimated];
            
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            
            NSLog(@"请求错误: 状态码 = %zd", error.code);

            if (failure) {
                failure(error);
            }
            
            [viewController hideHudAnimated];
        }];
        
    }
    
    if (mode == PostMode) {
        
        [manager POST:self.urlString parameters:self.parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            
            DebugLog(@"\n=========== response ===========\n%@:\n\n%@\n", self.parameters, responseObject);

            if (success){
                success(responseObject);
            };
            
            [viewController hideHudAnimated];

        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
           
            NSLog(@"请求错误: 状态码 = %zd", error.code);

            if (failure) {
                failure(error);
            }
            
            [viewController hideHudAnimated];
        }];
    }
    
    if (mode == PatchMode) {

        [manager PATCH:self.urlString parameters:self.parameters success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            
            DebugLog(@"\n=========== response ===========\n%@:\n\n%@\n%@\n", self.parameters, responseObject, task.response.URL);
            
            if (success){
                success(responseObject);
            };
            
            [viewController hideHudAnimated];

        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
           
            NSLog(@"请求错误: 状态码 = %zd", error.code);

            if (failure) {
                failure(error);
            }
            
            [viewController hideHudAnimated];
        }];
    }
    
    if (mode == DeleteMode) {
        
        [manager DELETE:self.urlString parameters:self.parameters success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
           
            DebugLog(@"\n=========== response ===========\n%@:\n\n%@\n%@\n", self.parameters, responseObject, task.response.URL);
            
            if (success){
                success(responseObject);
            };
            
            [viewController hideHudAnimated];
            
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            
            NSLog(@"请求错误: 状态码 = %zd", error.code);
            
            if (failure) {
                failure(error);
            }
            
            [viewController hideHudAnimated];            
        }];
    }
}

@end
