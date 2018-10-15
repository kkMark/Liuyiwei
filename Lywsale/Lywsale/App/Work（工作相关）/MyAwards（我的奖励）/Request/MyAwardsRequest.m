//
//  MyAwardsRequest.m
//  Lywsale
//
//  Created by 尚洋 on 2018/10/15.
//  Copyright © 2018年 黄锡凯. All rights reserved.
//

#import "MyAwardsRequest.h"

@implementation MyAwardsRequest

- (void)GetSumIntegralsuccess:(RequestSuccess)success failure:(RequestFailure)failure{
    
    self.urlString = [NSString stringWithFormat:@"http://39.108.140.12:28084/integral/sumIntegral"];
    [self requestAFMode:GetMode success:success failure:failure];
    
}

@end
