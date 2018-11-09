//
//  ExamContentViewModel.m
//  Lywsale
//
//  Created by 黄锡凯 on 2018/11/7.
//  Copyright © 2018 黄锡凯. All rights reserved.
//

#import "ExamContentViewModel.h"

@implementation ExamContentViewModel

- (void)submitExamWithModel:(ExamContentModel *)model
                    success:(RequestSuccess)success
                    failure:(RequestFailure)failure
{
    self.port = @"38082";
    self.urlString = [self getRequestUrl:@[@"exams"]];
    self.parameters = @{ @"trainTaskId" : model.trainTaskId,
                         @"examPaperId" : model.examPaperId,
                         @"entries" : model.entries };
    [self requestAFMode:PostMode success:success failure:failure];
}

- (void)examQuestionsWithIdString:(NSString *)idString success:(RequestSuccess)success failure:(RequestFailure)failure
{
    NSString *urlString = [NSString stringWithFormat:@"examQuestions/%@", idString];
    
    self.port = @"38082";
    self.urlString = [self getRequestUrl:@[urlString]];
    [self requestAFMode:GetMode success:success failure:failure];
}

@end
