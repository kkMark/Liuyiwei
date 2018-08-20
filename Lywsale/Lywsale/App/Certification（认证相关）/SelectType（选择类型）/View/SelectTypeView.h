//
//  SelectTypeView.h
//  Lywsale
//
//  Created by M on 2018/8/19.
//  Copyright © 2018年 黄锡凯. All rights reserved.
//

#import "BaseTableView.h"

@interface SelectTypeView : BaseTableView

@property (nonatomic, copy) NSDictionary *dictDataSource;
@property (nonatomic, assign) RegisteredUserType userType;

/// 前往控制器
@property (nonatomic, strong) void (^goViewController)(UIViewController *vc);

@end
