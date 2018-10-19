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
    
    self.port = @"18082";
    self.urlString = [self getRequestUrl:@[@"shoppingGuide", @"getSalesSituation"]];
    self.parameters = @{ @"shoppingGuideId" : GetUserDefault(UserID), @"month" : currentDate };
    [self requestMode:PostMode success:success failure:failure];
}

@end
