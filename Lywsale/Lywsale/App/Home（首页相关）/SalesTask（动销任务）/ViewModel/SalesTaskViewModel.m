
//
//  SalesTaskViewModel.m
//  Lywsale
//
//  Created by M on 2018/9/26.
//  Copyright © 2018年 黄锡凯. All rights reserved.
//

#import "SalesTaskViewModel.h"

@implementation SalesTaskViewModel

- (void)getSalesTask:(int)page type:(TaskType)type success:(nonnull RequestSuccess)success failure:(nonnull RequestFailure)failure {
    
    NSArray *arr = @[@"PENDING", @"FINISHED", @"EXPIRED"];
    NSString *urlString = [NSString stringWithFormat:@"dongxiaoActivities$enterable?status=%@&pageNumber=%d&pageSize=10", arr[type], page];
    
    self.port = @"38082";
    self.urlString = [self getRequestUrl:@[urlString]];
    [self requestAFMode:GetMode success:success failure:failure];
}


- (void)getCountWithSuccess:(RequestSuccess)success failure:(RequestFailure)failure {
    
    NSString *urlString = [NSString stringWithFormat:@"dongxiaoStrategyCounts$salesman"];
    
    self.port = @"38082";
    self.urlString = [self getRequestUrl:@[urlString]];
    [self requestAFMode:GetMode success:success failure:failure];
}

@end
