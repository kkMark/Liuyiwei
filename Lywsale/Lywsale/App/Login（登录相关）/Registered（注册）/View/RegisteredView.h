//
//  RegisteredView.h
//  Lywsale
//
//  Created by M on 2018/9/5.
//  Copyright © 2018年 黄锡凯. All rights reserved.
//

#import "BaseView.h"

@interface RegisteredView : BaseView

@property (nonatomic, strong) void (^goViewController)(UIViewController *vc);

@end
