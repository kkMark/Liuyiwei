//
//  LoginViewModel.h
//  Lywsale
//
//  Created by M on 2018/8/18.
//  Copyright © 2018年 黄锡凯. All rights reserved.
//

#import "BaseHttpRequest.h"

@interface LoginViewModel : BaseHttpRequest

/**
     登录接口

     @param account 用户
     @param password 密码
 */
- (void)loginWithAccount:(NSString *)account password:(NSString *)password success:(RequestSuccess)success failure:(RequestFailure)failure;

@end
