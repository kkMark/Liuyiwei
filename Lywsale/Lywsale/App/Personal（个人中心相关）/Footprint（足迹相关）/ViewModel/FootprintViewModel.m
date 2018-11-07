//
//  FootprintViewModel.m
//  Lywsale
//
//  Created by 黄锡凯 on 2018/11/6.
//  Copyright © 2018 黄锡凯. All rights reserved.
//

#import "FootprintViewModel.h"

@implementation FootprintViewModel

- (void)getLerrningWithPage:(int)page success:(RequestSuccess)success failure:(RequestFailure)failure {
    
    NSString *urlString = [NSString stringWithFormat:@"studiesAndExams?pageNum=%d&pageSize=10", page];
    
    self.port = @"38082";
    self.urlString = [self getRequestUrl:@[urlString]];
    [self requestAFMode:GetMode success:success failure:failure];
}

- (void)getCollectionWithPage:(int)page success:(RequestSuccess)success failure:(RequestFailure)failure {
    
    NSString *urlString = [NSString stringWithFormat:@"favorites$train?pageNum=%d&pageSize=10", page];
    
    self.port = @"38082";
    self.urlString = [self getRequestUrl:@[urlString]];
    [self requestAFMode:GetMode success:success failure:failure];
}

@end
