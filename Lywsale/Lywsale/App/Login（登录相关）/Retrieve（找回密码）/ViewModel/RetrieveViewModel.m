//
//  RetrieveViewModel.m
//  Lywsale
//
//  Created by M on 2018/9/5.
//  Copyright © 2018年 黄锡凯. All rights reserved.
//

#import "RetrieveViewModel.h"

@implementation RetrieveViewModel

- (void)sendCode:(NSString *)phone success:(RequestSuccess)success failure:(RequestFailure)failure {
    
    self.urlString = [self getRequestUrl:@[@"members", @"verificationCode"]];
    self.parameters = @{ @"mobile" : phone, @"type" : @"2" };
    [self requestMode:PostMode success:success failure:failure];
    
    NSLog(@"暂未测试该接口");
}

- (void)forgetPasswordAccount:(NSString *)account
                     password:(NSString *)password
                         code:(NSString *)code
                      success:(RequestSuccess)success
                      failure:(RequestFailure)failure
{
    self.urlString = [self getRequestUrl:@[@"members", @"forgetPassword"]];
    self.parameters = @{ @"mobile" : account, @"newPassword" : password, @"code" : code };
    [self requestMode:PostMode success:success failure:failure];
}

@end
