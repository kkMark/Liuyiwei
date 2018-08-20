//
//  BaseHttpRequest.h
//  Lywsale
//
//  Created by M on 2018/8/18.
//  Copyright © 2018年 黄锡凯. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^RequestSuccess)(NSDictionary *dict);
typedef void(^RequestFailure)(NSError *error);

typedef enum : NSUInteger {

    GetMode = 0,
    PostMode
    
} RequestMode;

@interface BaseHttpRequest : NSObject

@property (nonatomic, strong) NSString *urlString;
@property (nonatomic, strong) id parameters;
/// 是否加载 默认YES
@property (nonatomic, assign) BOOL isLoading;

/// 获取请求Url
- (NSString *)getRequestUrl:(NSArray *)parArr;

/**
     开始请求

     @param mode 请求类型
     @param success 成功回调
     @param failure 失败回调
 */
- (void)requestMode:(RequestMode)mode success:(RequestSuccess)success failure:(RequestFailure)failure;

@end
