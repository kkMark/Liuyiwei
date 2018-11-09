//
//  ExamResultsViewModel.m
//  Lywsale
//
//  Created by 黄锡凯 on 2018/11/8.
//  Copyright © 2018 黄锡凯. All rights reserved.
//

#import "ExamResultsViewModel.h"

@implementation ExamResultsViewModel

- (void)examQuestionsWithIdString:(NSString *)idString success:(RequestSuccess)success failure:(RequestFailure)failure
{
    NSString *urlString = [NSString stringWithFormat:@"exams/%@/result", idString];
    
    self.port = @"38082";
    self.urlString = [self getRequestUrl:@[urlString]];
    [self requestAFMode:GetMode success:success failure:failure];
}

@end
