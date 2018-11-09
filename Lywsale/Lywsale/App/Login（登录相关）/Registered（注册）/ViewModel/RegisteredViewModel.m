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
    [self requestAFMode:PostMode success:success failure:failure];
}

- (void)registered:(RegisteredModel *)model success:(RequestSuccess)success failure:(RequestFailure)failure {
    
    self.urlString = [self getRequestUrl:@[@"members", @"register"]];
    
    NSLog(@"暂未实现");
}

@end
