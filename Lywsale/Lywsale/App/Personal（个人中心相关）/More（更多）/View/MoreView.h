//
//  MoreView.h
//  Lywsale
//
//  Created by M on 2018/8/24.
//  Copyright © 2018年 黄锡凯. All rights reserved.
//

#import "BaseTableView.h"

@interface MoreView : BaseTableView

@property (nonatomic, strong) void (^goViewController)(UIViewController *vc);

@end
