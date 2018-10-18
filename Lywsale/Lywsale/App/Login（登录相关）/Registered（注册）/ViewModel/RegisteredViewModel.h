//
//  RegisteredViewModel.h
//  Lywsale
//
//  Created by 黄锡凯 on 2018/10/15.
//  Copyright © 2018 黄锡凯. All rights reserved.
//

#import "BaseHttpRequest.h"
#import "RegisteredModel.h"

@interface RegisteredViewModel : BaseHttpRequest

/**
     发送验证码
 
     @param phone 手机号
 */
- (void)sendCode:(NSString *)phone success:(RequestSuccess)success failure:(RequestFailure)failure;

/**
     注册
 
     @param model 注册模型
 */
- (void)registered:(RegisteredModel *)model
           success:(RequestSuccess)success
           failure:(RequestFailure)failure;

@end
