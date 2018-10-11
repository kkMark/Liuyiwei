//
//  AmountCell.m
//  Lywsale
//
//  Created by 黄锡凯 on 2018/10/9.
//  Copyright © 2018 黄锡凯. All rights reserved.
//

#import "AmountCell.h"

@implementation AmountCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setupSubviews];
    }
    
    return self;
}

- (void)setupSubviews {
    
    UITextField *textFiled = [[UITextField alloc] initWithFrame:CGRectMake(20, 0, ScreenWidth - 30, 45)];
    textFiled.placeholder = @"请填写需要提现的金额";
    textFiled.font = [UIFont systemFontOfSize:14];
    [self.contentView addSubview:textFiled];
    
    UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(20, 44, ScreenWidth - 40, 0.3)];
    lineView.backgroundColor = [UIColor colorWithHexString:@"0xC8CEE9"];
    [self.contentView addSubview:lineView];
}

@end
