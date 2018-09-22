//
//  ReceptionRemarkCell.m
//  Lywsale
//
//  Created by M on 2018/9/22.
//  Copyright © 2018年 黄锡凯. All rights reserved.
//

#import "ReceptionRemarkCell.h"

@interface ReceptionRemarkCell ()

@property (nonatomic, strong) UILabel *titleLabel;

@end

@implementation ReceptionRemarkCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self setupSubviews];
    }
    
    return self;
}

- (void)setupSubviews {
    
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, 0, ScreenWidth, 45)];
    titleLabel.text = self.title;
    titleLabel.font = [UIFont systemFontOfSize:14];
    titleLabel.textColor = kMainTextColor;
    [self.contentView addSubview:titleLabel];
    
    // 文本框
    UITextView *textView = [[UITextView alloc] initWithFrame:CGRectMake(10, titleLabel.maxY - 10, ScreenWidth - 20, 140)];
    textView.font = [UIFont systemFontOfSize:14];
    textView.textColor = [UIColor blackColor];
    [self addSubview:textView];
    
    // 文本框提示
    UILabel *tipLabel = [[UILabel alloc] initWithFrame:CGRectMake(4.5, 8.5, textView.width, 15)];
    tipLabel.text = @"请输入内容";
    tipLabel.font = [UIFont systemFontOfSize:14];
    tipLabel.textColor = [UIColor colorWithHexString:@"0x999999"];
    tipLabel.numberOfLines = 0;
    tipLabel.height = [tipLabel getTextHeight];
    [textView addSubview:tipLabel];
    
    // 监听文本框
    [[textView rac_textSignal] subscribeNext:^(NSString * _Nullable x) {
        tipLabel.hidden = x.length > 0 ? YES : NO;
    }];
    
    self.titleLabel = titleLabel;
}

- (void)setTitle:(NSString *)title {
    
    _title = title;
    self.titleLabel.text = title;
}

@end
