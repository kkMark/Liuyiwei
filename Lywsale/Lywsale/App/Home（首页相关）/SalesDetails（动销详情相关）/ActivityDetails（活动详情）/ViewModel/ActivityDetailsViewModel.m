//
//  ActivityDetailsViewModel.m
//  Lywsale
//
//  Created by 黄锡凯 on 2018/11/5.
//  Copyright © 2018 黄锡凯. All rights reserved.
//

#import "ActivityDetailsViewModel.h"

@implementation ActivityDetailsViewModel

- (void)getDataSourceWithId:(NSString *)idString success:(RequestSuccess)success failure:(RequestFailure)failure {
    
    NSString *urlString = [NSString stringWithFormat:@"dongxiaoActivities/id=%@", idString];
    
    self.port = @"38082";
    self.urlString = [self getRequestUrl:@[urlString]];
    [self requestAFMode:GetMode success:success failure:failure];
}

- (void)getMembersListWithSuccess:(RequestSuccess)success failure:(RequestFailure)failure {
    
    self.port = @"28081";
    self.urlString = [self getRequestUrl:@[@"others", @"getClerkList"]];
    self.parameters = @{@"shoporgId" : GetUserDefault(ShoporgId)};
    [self requestAFMode:PatchMode success:success failure:failure];
}

- (void)assignedTasksWithModel:(SalesTaskModel *)model success:(RequestSuccess)success failure:(RequestFailure)failure {
    
    NSString *urlString = [NSString stringWithFormat:@"dongxiaoActivityAssignments?dongxiaoActivityId=%@&dongxiaoStrategyType=%@", model.id, model.strategiesModel.strategyType];
    
    self.port = @"38082";
    self.urlString = [self getRequestUrl:@[urlString]];
    [self requestAFMode:GetMode success:success failure:failure];
}

@end
