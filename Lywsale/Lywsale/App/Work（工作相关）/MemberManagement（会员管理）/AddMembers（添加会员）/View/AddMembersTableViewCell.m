//
//  AddMembersTableViewCell.m
//  Lywsale
//
//  Created by 尚洋 on 2018/10/22.
//  Copyright © 2018年 黄锡凯. All rights reserved.
//

#import "AddMembersTableViewCell.h"

@implementation AddMembersTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        [self setupUI];
        
    }
    
    return self;
}

-(void)setupUI{
    
    self.titleLabel = [UILabel new];
    self.titleLabel.font = [UIFont systemFontOfSize:13];
    [self.contentView addSubview:self.titleLabel];
    
    self.titleLabel.sd_layout
    .leftSpaceToView(self.contentView, 15)
    .centerYEqualToView(self.contentView)
    .heightIs(13);
    [self.titleLabel setSingleLineAutoResizeWithMaxWidth:200];
    
    self.contentLabel = [UILabel new];
    self.contentLabel.font = [UIFont systemFontOfSize:11];
    [self.contentView addSubview:self.contentLabel];
    
    self.contentLabel.sd_layout
    .rightSpaceToView(self.contentView, 10)
    .centerYEqualToView(self.contentView)
    .heightIs(11);
    [self.contentLabel setSingleLineAutoResizeWithMaxWidth:200];
    
}

@end
