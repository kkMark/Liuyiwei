//
//  LoginView.h
//  Lywsale
//
//  Created by M on 2018/8/18.
//  Copyright © 2018年 黄锡凯. All rights reserved.
//

#import "BaseView.h"

@interface LoginView : BaseView

@property (nonatomic, strong) void (^goViewController)(UIViewController *vc);
@property (nonatomic, strong) void (^loginBlock)(NSString *account, NSString *password);

@end
