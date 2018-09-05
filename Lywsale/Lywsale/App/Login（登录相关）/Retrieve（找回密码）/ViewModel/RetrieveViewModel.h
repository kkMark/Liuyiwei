//
//  RetrieveViewModel.h
//  Lywsale
//
//  Created by M on 2018/9/5.
//  Copyright © 2018年 黄锡凯. All rights reserved.
//

#import "BaseHttpRequest.h"

@interface RetrieveViewModel : BaseHttpRequest

/**
     重置密码
 
     @param account 用户
     @param password 密码
     @param code 验证码
 */
- (void)forgetPasswordAccount:(NSString *)account
                     password:(NSString *)password
                         code:(NSString *)code
                      success:(RequestSuccess)success
                      failure:(RequestFailure)failure;

@end
