//
//  OrderManageListViewController.h
//  Lywsale
//
//  Created by 尚洋 on 2018/10/9.
//  Copyright © 2018年 黄锡凯. All rights reserved.
//

#import "BaseViewController.h"

@interface OrderManageListViewController : BaseViewController

/// 0 = 全部 1 = 待付款 2 = 待收货 3 = 已完成 4 = 已取消
@property (nonatomic ,assign) NSInteger type;

@end
