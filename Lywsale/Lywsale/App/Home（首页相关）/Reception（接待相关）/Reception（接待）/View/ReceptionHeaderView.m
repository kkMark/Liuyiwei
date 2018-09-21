//
//  ReceptionHeaderView.m
//  Lywsale
//
//  Created by M on 2018/9/11.
//  Copyright © 2018年 黄锡凯. All rights reserved.
//

#import "ReceptionHeaderView.h"

@interface ReceptionHeaderView ()

@property (nonatomic, strong) UILabel *nameLabel;

@end

@implementation ReceptionHeaderView

- (void)setupSubviews {
    
    // 时间
    self.nameLabel = [[UILabel alloc] init];
    self.nameLabel.frame = CGRectMake(15, 15 , ScreenWidth - 30, 15);
    self.nameLabel.text = @"李小姐接待跟踪";
    self.nameLabel.font = [UIFont systemFontOfSize:16];
    self.nameLabel.textColor = kMainTextColor;
    [self addSubview:self.nameLabel];
    
    NSArray *titles = @[@"咨询药品：", @"接待日期：", @"接待备注："];
    NSArray *contents = @[@"博路定", @"2018-05-13  18:11", @"报价了博路定的价格208元，顾客现场未定"];
    float y = 0;
    for (int i = 0; i < titles.count; i++) {
        
        UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, self.nameLabel.maxY + 15 + 25 * i, 0, 0)];
        titleLabel.text = titles[i];
        titleLabel.font = [UIFont systemFontOfSize:14];
        titleLabel.textColor = [UIColor colorWithHexString:@"0x666666"];
        titleLabel.height = [titleLabel getTextHeight];
        titleLabel.width = [titleLabel getTextWidth];
        [self addSubview:titleLabel];
        
        UILabel *contentLabel = [[UILabel alloc] initWithFrame:CGRectMake(110, titleLabel.y, ScreenWidth - 125, 0)];
        contentLabel.text = contents[i];
        contentLabel.font = [UIFont systemFontOfSize:14];
        contentLabel.textColor = [UIColor colorWithHexString:@"0x666666"];
        contentLabel.numberOfLines = 0;
        contentLabel.height = [contentLabel getTextHeight];
        [self addSubview:contentLabel];
        
        if (contentLabel.height > titleLabel.height) {
            contentLabel.textAlignment = NSTextAlignmentLeft;
        }
        else contentLabel.textAlignment = NSTextAlignmentRight;

        y = contentLabel.maxY + 15;
    }
    
    for (int i = 0; i < 2; i++) {
        
        UIColor *color = i == 0 ? kMainColor : [UIColor colorWithHexString:@"0xF5A520"];
        float width = 150;
        float x = (ScreenWidth - width * 2) / 3;
        
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(0, y, width, 35);
        btn.x = i == 0 ? x : x * 2 + width;
        btn.layer.cornerRadius = btn.height / 2;
        btn.layer.masksToBounds = YES;
        btn.layer.borderWidth = 1;
        btn.layer.borderColor = color.CGColor;
        [self addSubview:btn];
        
        UIImageView *iconImgView = [[UIImageView alloc] initWithFrame:CGRectMake(25, 0, 24, 24)];
        iconImgView.centerY = btn.height / 2;
        iconImgView.image = [UIImage imageNamed:i == 0 ? @"reception-call" : @"reception-remark"];
        [btn addSubview:iconImgView];
        
        UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(iconImgView.maxX + 10, 0, 0, btn.height)];
        titleLabel.width = width - titleLabel.x;
        titleLabel.text = i == 0 ? @"打电话" : @"接待备注";
        titleLabel.font = [UIFont systemFontOfSize:15];
        titleLabel.textColor = color;
        [btn addSubview:titleLabel];
        
        [[btn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
           
            NSString *vcName = @"ReceptionRemarkViewController";
            if ([titleLabel.text isEqualToString:@"接待备注"]) {   
                vcName = @"ReceptionRemarkViewController";
            }
            
            if (vcName.length != 0 && self.goViewControllerBlock) {
                self.goViewControllerBlock([NSClassFromString(vcName) new]);
            }
        }];
        
        self.viewHeight = btn.maxY + 15;
    }
}

@end
