//
//  LearningTaskViewModel.m
//  Lywsale
//
//  Created by 黄锡凯 on 2018/10/19.
//  Copyright © 2018 黄锡凯. All rights reserved.
//

#import "LearningTaskViewModel.h"

@implementation LearningTaskViewModel

- (void)getTask:(int)page type:(LearningTaskType)type success:(RequestSuccess)success failure:(RequestFailure)failure
{
    NSArray *arr = @[@"PENDING", @"FINISHED", @"EXPIRED"];
    NSString *urlString = [NSString stringWithFormat:@"trainTasks$enterable?pageNum=%d&pageSize=10&status=%@", page, arr[type]];
    
    self.port = @"18082";
    self.urlString = [self getRequestUrl:@[urlString]];
    [self requestAFMode:GetMode success:success failure:failure];
}

- (void)getCountWithSuccess:(RequestSuccess)success failure:(RequestFailure)failure {
    
    NSString *urlString = [NSString stringWithFormat:@"trainTaskCounts$salesman"];
    
    self.port = @"38082";
    self.urlString = [self getRequestUrl:@[urlString]];
    [self requestAFMode:GetMode success:success failure:failure];
}

@end
