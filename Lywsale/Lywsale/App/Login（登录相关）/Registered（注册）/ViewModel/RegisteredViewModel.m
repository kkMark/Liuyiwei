//
//  RegisteredViewModel.m
//  Lywsale
//
//  Created by 黄锡凯 on 2018/10/15.
//  Copyright © 2018 黄锡凯. All rights reserved.
//

#import "RegisteredViewModel.h"

@implementation RegisteredViewModel

- (void)sendCode:(NSString *)phone success:(RequestSuccess)success failure:(RequestFailure)failure {
    
    self.urlString = [self getRequestUrl:@[@"members", @"verificationCode"]];
    self.parameters = @{ @"mobile" : phone, @"type" : @"1" };
    [self requestMode:PostMode success:success failure:failure];
    
    NSLog(@"暂未测试该接口");
}

- (void)registered:(NSString *)account
          password:(NSString *)password
              code:(NSString *)code
           success:(RequestSuccess)success
           failure:(RequestFailure)failure
{
    NSLog(@"暂未实现");
}

@end
