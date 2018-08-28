//
//  HomePageView.h
//  Lywsale
//
//  Created by M on 2018/8/28.
//  Copyright © 2018年 黄锡凯. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomePageView : UIScrollView <UIScrollViewDelegate>

@property (nonatomic, assign) NSInteger index;
@property (nonatomic, strong) void (^moveBlock)(NSInteger index);

@end
