//
//  WriteInfoTypeCell.m
//  Lywsale
//
//  Created by M on 2018/8/22.
//  Copyright © 2018年 黄锡凯. All rights reserved.
//

#import "WriteInfoTypeCell.h"

@implementation WriteInfoTypeCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        [self setupSubviews];
    }
    
    return self;
}

- (void)setupSubviews {
    
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 0, 45, 45)];
    titleLabel.text = @"我是";
    titleLabel.font = [UIFont systemFontOfSize:14];
    titleLabel.textColor = kMainTextColor;
    [self.contentView addSubview:titleLabel];

    float x = titleLabel.maxX + 15;
    for (int i = 0; i < 2; i++) {
        
        UIButton *typeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        typeBtn.frame = CGRectMake(x + i * 70, 0, 60, titleLabel.height);
        [self.contentView addSubview:typeBtn];
        
        UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 15, 15)];
        imgView.tag = i + 100;
        imgView.centerY = typeBtn.centerY;
        imgView.image = [UIImage imageNamed:i == 0 ? @"checkbox_sel" : @"checkbox_nor"];
        [typeBtn addSubview:imgView];
        
        UILabel *typeLabel = [[UILabel alloc] initWithFrame:CGRectMake(imgView.maxX + 5, 0, 0, 45)];
        typeLabel.width = typeBtn.width - typeLabel.x;
        typeLabel.text = i == 0 ? @"店员" : @"店长";
        typeLabel.font = [UIFont systemFontOfSize:14];
        typeLabel.textColor = kMainTextColor;
        [typeBtn addSubview:typeLabel];
        
        [[typeBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
           
            for (int index = 0; index < 2; index++) {
                
                UIImageView *imgView = [self.contentView viewWithTag:index + 100];
                imgView.image = [UIImage imageNamed:@"checkbox_nor"];
            }
            
            imgView.image = [UIImage imageNamed:@"checkbox_sel"];
            if (self.selectBlock) self.selectBlock(i);
        }];
    }
}

@end
