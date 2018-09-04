//
//  HomePageViewModel.m
//  Lywsale
//
//  Created by M on 2018/9/4.
//  Copyright © 2018年 黄锡凯. All rights reserved.
//

#import "HomePageViewModel.h"

@implementation HomePageViewModel

- (void)getSalesSituation:(NSString *)shoppingGuideId
                    month:(NSString *)month
                  success:(RequestSuccess)success
                  failure:(RequestFailure)failure
{
    self.urlString = [self getRequestUrl:@[@"shoppingGuide", @"getSalesSituation"]];
    self.parameters = @{ @"shoppingGuideId" : shoppingGuideId, @"month" : month };
    [self requestMode:PostMode success:success failure:failure];
}

@end
