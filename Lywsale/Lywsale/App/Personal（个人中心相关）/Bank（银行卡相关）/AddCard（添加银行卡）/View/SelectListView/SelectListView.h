//
//  SelectListView.h
//  Lywsale
//
//  Created by 黄锡凯 on 2018/10/20.
//  Copyright © 2018 黄锡凯. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SelectListView : UIView

- (instancetype)initWithFrame:(CGRect)frame title:(NSString *)title;

@property (nonatomic, copy) NSArray *dataSource;

@end
