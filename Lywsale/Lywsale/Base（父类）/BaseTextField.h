//
//  BaseTextField.h
//  GanLuXiangBan
//
//  Created by 尚洋 on 2018/5/5.
//  Copyright © 2018年 黄锡凯. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseTextField : UITextField

@property (nonatomic ,assign) NSIndexPath *indextPath;
///左边带字
+ (instancetype)textFieldWithPlaceHolder:(NSString *)placeHolder headerViewText:(NSString *)headerViewText;
///左边带图片
+ (instancetype)textFieldWithPlaceHolder:(NSString *)placeHolder leftImage:(NSString *)leftImage;

@end
