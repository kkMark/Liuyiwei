
//
//  SalesTaskViewModel.m
//  Lywsale
//
//  Created by M on 2018/9/26.
//  Copyright © 2018年 黄锡凯. All rights reserved.
//

#import "SalesTaskViewModel.h"

@implementation SalesTaskViewModel

- (void)getSalesTask:(int)page success:(RequestSuccess)success failure:(RequestFailure)failure {
    
    NSString *urlString = [NSString stringWithFormat:@"dongxiaoActivities$enterable?pageNumber=10&pageSize=%d", page];
    
    self.urlString = [self getRequestUrl:@[urlString]];
    [self requestMode:GetMode success:success failure:failure];
}

@end
