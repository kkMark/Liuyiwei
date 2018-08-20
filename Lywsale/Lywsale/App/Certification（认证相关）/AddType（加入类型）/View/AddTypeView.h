//
//  AddTypeView.h
//  Lywsale
//
//  Created by M on 2018/8/19.
//  Copyright © 2018年 黄锡凯. All rights reserved.
//

#import "BaseTableView.h"

@interface AddTypeView : BaseTableView

/// 注册的用户类型
@property (nonatomic, assign) RegisteredUserType type;

/// 前往控制器
@property (nonatomic, strong) void (^goViewController)(UIViewController *vc);

@end
