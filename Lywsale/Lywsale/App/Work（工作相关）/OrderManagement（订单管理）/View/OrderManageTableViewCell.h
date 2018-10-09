//
//  OrderManageTableViewCell.h
//  Lywsale
//
//  Created by 尚洋 on 2018/10/9.
//  Copyright © 2018年 黄锡凯. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OrderManageModel.h"

@interface OrderManageTableViewCell : UITableViewCell

@property (nonatomic ,copy) OrderManageModel *model;

@property (nonatomic ,strong) UIView *BGView;
///订单号
@property (nonatomic ,strong) UILabel *ordermainIdLabel;
///客户信息
@property (nonatomic ,strong) UILabel *customerInformationLabel;
///日期
@property (nonatomic ,strong) UILabel *timeLabel;
///状态 0000 = 等待支付 0001 = 等待配货 0003 = 等待发货 0005 = 已发货 0007 = 已签收 0009 = 已调拨
@property (nonatomic ,strong) UILabel *curStatusIdLabel;
///配送方式
@property (nonatomic ,strong) UILabel *distributionLabel;
///金额
@property (nonatomic ,strong) UILabel *amountLabel;

@end
