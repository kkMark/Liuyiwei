//
//  OrderManageModel.h
//  Lywsale
//
//  Created by 尚洋 on 2018/10/9.
//  Copyright © 2018年 黄锡凯. All rights reserved.
//

#import "BaseModel.h"

@interface OrderManageModel : BaseModel
///订单号
@property (nonatomic ,copy) NSString *ordermainId;
///客户信息
@property (nonatomic ,copy) NSString *customerInformation;
///日期
@property (nonatomic ,copy) NSString *time;
///状态 0000 = 等待支付 0001 = 等待配货 0003 = 等待发货 0005 = 已发货 0007 = 已签收 0009 = 已调拨
@property (nonatomic ,copy) NSString *curStatusId;
///配送方式
@property (nonatomic ,copy) NSString *distribution;
///金额
@property (nonatomic ,assign) NSInteger amount;

@end
