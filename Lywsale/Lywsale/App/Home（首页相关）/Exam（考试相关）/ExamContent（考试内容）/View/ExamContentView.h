//
//  ExamContentView.h
//  Lywsale
//
//  Created by 黄锡凯 on 2018/11/7.
//  Copyright © 2018 黄锡凯. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ExamContentView : UIView

- (void)setTitle:(NSString *)title content:(NSArray *)content;

@property (nonatomic, assign) int index;
@property (nonatomic, copy) void (^selIndex)(int index);

@end
