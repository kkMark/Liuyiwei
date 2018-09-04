//
//  LoginViewModel.m
//  Lywsale
//
//  Created by M on 2018/8/18.
//  Copyright © 2018年 黄锡凯. All rights reserved.
//

#import "LoginViewModel.h"

@implementation LoginViewModel

- (void)loginWithAccount:(NSString *)account
                password:(NSString *)password
                 success:(RequestSuccess)success
                 failure:(RequestFailure)failure
{
    self.urlString = [self getRequestUrl:@[@"members", @"login"]];
    self.parameters = @{ @"memberMob" : account, @"memberPass" : password };
    [self requestMode:PostMode success:success failure:failure];
}

@end
