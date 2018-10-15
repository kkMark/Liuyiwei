//
//  RegisteredViewModel.h
//  Lywsale
//
//  Created by 黄锡凯 on 2018/10/15.
//  Copyright © 2018 黄锡凯. All rights reserved.
//

#import "BaseHttpRequest.h"

@interface RegisteredViewModel : BaseHttpRequest

/**
     发送验证码
 
     @param phone 手机号
 */
- (void)sendCode:(NSString *)phone success:(RequestSuccess)success failure:(RequestFailure)failure;

/**
     注册
 
     @param account 用户
     @param password 密码
     @param code 验证码
 */
- (void)registered:(NSString *)account
          password:(NSString *)password
              code:(NSString *)code
           success:(RequestSuccess)success
           failure:(RequestFailure)failure;

@end
