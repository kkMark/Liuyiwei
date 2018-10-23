
//
//  StatisticsTimeCell.m
//  Lywsale
//
//  Created by 黄锡凯 on 2018/10/22.
//  Copyright © 2018 黄锡凯. All rights reserved.
//

#import "StatisticsTimeCell.h"

@interface StatisticsTimeCell ()

@property (nonatomic, strong) UIView *bgView;

@end

@implementation StatisticsTimeCell
@synthesize bgView;

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        [self setupSubviews];
    }
    
    return self;
}

- (void)setupSubviews {
    
    bgView = [[UIView alloc] initWithFrame:CGRectMake(15, 0, ScreenWidth - 30, 45)];
    bgView.backgroundColor = [UIColor whiteColor];
    [self.contentView addSubview:bgView];
    
    CGRect frame = CGRectMake(10, 0, 0, bgView.height);
    for (int i = 0; i < 2; i++) {
        
        UIButton *dateBtn = [self dateBtnWithFrame:frame];
        [bgView addSubview:dateBtn];
        
        if (i == 0) {
            
            UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(dateBtn.maxX + 10, 0, 0, bgView.height)];
            titleLabel.text = @"至";
            titleLabel.font = [UIFont systemFontOfSize:12];
            titleLabel.textColor = kMainTextColor;
            titleLabel.width = [titleLabel getTextWidth];
            [bgView addSubview:titleLabel];
            
            frame.origin.x = titleLabel.maxX + 10;
        }
        else frame.origin.x += dateBtn.width;
    }
    
    UIButton *okBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    okBtn.frame = CGRectMake(frame.origin.x + 10, 0, 0, 25);
    okBtn.width = bgView.width - okBtn.x - 20;
    okBtn.centerY = bgView.height / 2;
    okBtn.backgroundColor = kMainColor;
    okBtn.layer.cornerRadius = 5;
    okBtn.layer.masksToBounds = YES;
    okBtn.titleLabel.font = [UIFont systemFontOfSize:12];
    [okBtn setTitle:@"确定" forState:UIControlStateNormal];
    [okBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [bgView addSubview:okBtn];
}

- (UIButton *)dateBtnWithFrame:(CGRect)rect {
    
    UIButton *dateBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    dateBtn.frame = rect;
    dateBtn.centerY = bgView.height / 2;
    [bgView addSubview:dateBtn];
    
    UILabel *dateLabel = [[UILabel alloc] initWithFrame:CGRectMake(5, 0, 0, 45)];
    dateLabel.text = @"2018-09-02";
    dateLabel.font = [UIFont systemFontOfSize:12];
    dateLabel.textColor = kMainTextColor;
    dateLabel.width = [dateLabel getTextWidth];
    [dateBtn addSubview:dateLabel];
    
    UIImage *img = [UIImage imageNamed:@"more1"];
    UIImageView *moreImgView = [[UIImageView alloc] initWithImage:img];
    moreImgView.size = img.size;
    moreImgView.x = dateLabel.maxX + 5;
    moreImgView.centerY = dateBtn.height / 2;
    [dateBtn addSubview:moreImgView];
    
    UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, moreImgView.maxY + 5, moreImgView.maxX, 0.5)];
    lineView.backgroundColor = [UIColor colorWithHexString:@"0xC8CEE9"];
    [dateBtn addSubview:lineView];
    
    dateBtn.width = lineView.width;
    return dateBtn;
}

@end
