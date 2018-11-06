//
//  HomePageViewModel.m
//  Lywsale
//
//  Created by M on 2018/9/4.
//  Copyright © 2018年 黄锡凯. All rights reserved.
//

#import "HomePageViewModel.h"

@implementation HomePageViewModel

/// 获取导购每月销售任务完成情况
- (void)getSalesSituationSuccess:(RequestSuccess)success failure:(RequestFailure)failure {
    
    NSDateFormatter * dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyyMM"];
    
    NSString *currentDate = [dateFormatter stringFromDate:[NSDate date]];
    NSString *urlString = [NSString stringWithFormat:@"shoppingGuide/getSalesSituation?shoppingGuideId=%@&yearMonth=%@&shoporgId=%@", GetUserDefault(UserID), currentDate, GetUserDefault(ShoporgId)];
    
    self.port = @"18082";
    self.urlString = [self getRequestUrl:@[urlString]];
    [self requestAFMode:GetMode success:success failure:failure];
}

@end
