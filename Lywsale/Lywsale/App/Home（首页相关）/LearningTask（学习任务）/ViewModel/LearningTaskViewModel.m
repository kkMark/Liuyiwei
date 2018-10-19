//
//  LearningTaskViewModel.m
//  Lywsale
//
//  Created by 黄锡凯 on 2018/10/19.
//  Copyright © 2018 黄锡凯. All rights reserved.
//

#import "LearningTaskViewModel.h"

@implementation LearningTaskViewModel

- (void)getTask:(int)page success:(RequestSuccess)success failure:(RequestFailure)failure
{
    NSString *urlString = [NSString stringWithFormat:@"trainTasks$inProgress?pageNum=%d&pageSize=10", page];
    
    self.port = @"18082";
    self.urlString = [self getRequestUrl:@[urlString]];
    [self requestMode:GetMode success:success failure:failure];
}

@end
