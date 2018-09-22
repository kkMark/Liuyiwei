//
//  RemarkMenuView.h
//  Lywsale
//
//  Created by M on 2018/9/22.
//  Copyright © 2018年 黄锡凯. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface RemarkMenuView : UIView

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSArray *dataSources;
@property (nonatomic, strong) NSString *currentType;
@property (nonatomic, assign) BOOL isShow;

@property (nonatomic, copy) void (^selectTypeBlock)(NSString *type);

@end

NS_ASSUME_NONNULL_END
