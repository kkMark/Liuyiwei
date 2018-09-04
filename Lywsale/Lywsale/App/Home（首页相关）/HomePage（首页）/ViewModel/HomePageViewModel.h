//
//  HomePageViewModel.h
//  Lywsale
//
//  Created by M on 2018/9/4.
//  Copyright © 2018年 黄锡凯. All rights reserved.
//

#import "BaseHttpRequest.h"

@interface HomePageViewModel : BaseHttpRequest

#pragma mark - 导购相关

/**
     获取导购每月销售任务完成情况

     @param shoppingGuideId 导购ID
     @param month 月份
 */
- (void)getSalesSituation:(NSString *)shoppingGuideId
                    month:(NSString *)month
                  success:(RequestSuccess)success
                  failure:(RequestFailure)failure;

@end
