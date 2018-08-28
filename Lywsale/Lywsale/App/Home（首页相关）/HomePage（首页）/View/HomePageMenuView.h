//
//  HomePageMenuView.h
//  Lywsale
//
//  Created by M on 2018/8/25.
//  Copyright © 2018年 黄锡凯. All rights reserved.
//

#import "BaseView.h"

@interface HomePageMenuView : BaseView

@property (nonatomic, assign) float headerHeight;

@property (nonatomic, assign) NSInteger index;
@property (nonatomic, strong) void (^selectIndex)(NSInteger index);

@end
