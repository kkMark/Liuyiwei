
//
//  DailyTaskViewModel.m
//  Lywsale
//
//  Created by 黄锡凯 on 2018/10/19.
//  Copyright © 2018 黄锡凯. All rights reserved.
//

#import "DailyTaskViewModel.h"

@implementation DailyTaskViewModel

- (void)getDailyTask:(int)page type:(NSString *)type success:(RequestSuccess)success failure:(RequestFailure)failure
{
    NSString *urlString = [NSString stringWithFormat:@"others/getDailyTask?shoppingGuideId=%@&type=%@&pageNum=%d&pageSize=10", GetUserDefault(UserID), type, page];
    
    self.port = @"18082";
    self.urlString = [self getRequestUrl:@[urlString]];
    [self requestAFMode:GetMode success:success failure:failure];
}

@end
