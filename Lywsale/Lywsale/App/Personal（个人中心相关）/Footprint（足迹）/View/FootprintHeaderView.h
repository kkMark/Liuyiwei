//
//  FootprintHeaderView.h
//  Lywsale
//
//  Created by M on 2018/8/22.
//  Copyright © 2018年 黄锡凯. All rights reserved.
//

#import "BaseView.h"

@interface FootprintHeaderView : BaseView

@property (nonatomic, assign) float viewHeight;
@property (nonatomic, strong) void (^selectIndex)(NSInteger index);

@end
