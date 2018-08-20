//
//  ApplyCell.m
//  Lywsale
//
//  Created by M on 2018/8/19.
//  Copyright © 2018年 黄锡凯. All rights reserved.
//

#import "ApplyCell.h"

@implementation ApplyCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        [self setupSubviews];
    }
    
    return self;
}

- (void)setupSubviews {
    
    self.textField = [[UITextField alloc] initWithFrame:CGRectMake(20, 0, ScreenWidth - 40, 45)];
    self.textField.font = [UIFont systemFontOfSize:14];
    self.textField.clearButtonMode = UITextFieldViewModeWhileEditing;
    [self.contentView addSubview:self.textField];
}

@end
