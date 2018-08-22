//
//  WriteInfoTextFieldCell.m
//  Lywsale
//
//  Created by M on 2018/8/22.
//  Copyright © 2018年 黄锡凯. All rights reserved.
//

#import "WriteInfoTextFieldCell.h"

@interface WriteInfoTextFieldCell ()

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UITextField *textField;

@end

@implementation WriteInfoTextFieldCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        [self setupSubviews];
    }
    
    return self;
}

- (void)setupSubviews {
    
    self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 0, 45, 45)];
    self.titleLabel.font = [UIFont boldSystemFontOfSize:14];
    self.titleLabel.textColor = kMainTextColor;
    [self.contentView addSubview:self.titleLabel];
    
    self.textField = [[UITextField alloc] initWithFrame:CGRectMake(self.titleLabel.maxX + 15, 0, 0, 45)];
    self.textField.width = ScreenWidth - self.textField.x;
    self.textField.font = [UIFont systemFontOfSize:14];
    self.textField.clearButtonMode = UITextFieldViewModeWhileEditing;
    [self addSubview:self.textField];
}

- (void)setTitle:(NSString *)title {
    
    _title = title;
    self.titleLabel.text = title;
}

- (void)setPlaceholder:(NSString *)placeholder {
    
    _placeholder = placeholder;
    self.textField.placeholder = placeholder;
}

@end
