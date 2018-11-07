//
//  TrainingViewModel.m
//  Lywsale
//
//  Created by 黄锡凯 on 2018/11/6.
//  Copyright © 2018 黄锡凯. All rights reserved.
//

#import "TrainingViewModel.h"

@implementation TrainingViewModel

- (void)getTrainsWithId:(NSString *)idString success:(RequestSuccess)success failure:(RequestFailure)failure {
    
    NSString *urlString = [NSString stringWithFormat:@"trains/%@", idString];
    
    self.port = @"38082";
    self.urlString = [self getRequestUrl:@[urlString]];
    [self requestAFMode:GetMode success:success failure:failure];
}

- (void)collectionWithIsCollection:(BOOL)isCollection idString:(NSString *)idString success:(RequestSuccess)success failure:(RequestFailure)failure {
    
    self.port = @"38082";

    if (isCollection) {
        
        self.urlString = [self getRequestUrl:@[@"favorites$train"]];
        self.parameters = @{@"trainId" : idString};
        [self requestMode:PostMode success:success failure:failure];
    }
    else {
        
        NSString *urlString = [NSString stringWithFormat:@"favorites/%@", idString];
        self.urlString = [self getRequestUrl:@[urlString]];
        [self requestAFMode:DeleteMode success:success failure:failure];
    }
}

- (void)getEvaluationStatisticalWithId:(NSString *)idString success:(RequestSuccess)success failure:(RequestFailure)failure {
    
    NSString *urlString = [NSString stringWithFormat:@"evaluationSummations$train/byTrainId/%@", idString];
    
    self.port = @"38082";
    self.urlString = [self getRequestUrl:@[urlString]];
    [self requestAFMode:GetMode success:success failure:failure];
}

- (void)getEvaluationWithId:(NSString *)idString page:(int)page success:(RequestSuccess)success failure:(RequestFailure)failure
{
    NSString *urlString = [NSString stringWithFormat:@"evaluations$train?trainId=%@&pageNumber=%d&pageSize=10", idString, page];
    
    self.port = @"38082";
    self.urlString = [self getRequestUrl:@[urlString]];
    [self requestAFMode:GetMode success:success failure:failure];
}

- (void)submitEvaluationWithModel:(EvaluationModel *)model success:(RequestSuccess)success failure:(RequestFailure)failure
{
    self.port = @"38082";
    self.urlString = [self getRequestUrl:@[@"evaluations$train"]];
    self.parameters = @{ @"trainId" : model.id,
                         @"score" : @([model.score intValue]),
                         @"content" : model.content,
                         @"unnamed" : @([model.unnamed intValue]) };
    [self requestAFMode:PostMode success:success failure:failure];
}

@end
