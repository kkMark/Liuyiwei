//
//  TaskTypeCell.m
//  Lywsale
//
//  Created by M on 2018/9/4.
//  Copyright © 2018年 黄锡凯. All rights reserved.
//

#import "TaskTypeCell.h"

@implementation TaskTypeCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self setupSubviews];
    }
    
    return self;
}

- (void)setupSubviews {
    
    NSArray *imgs = @[@"homepage_pin", @"homepage_daily", @"homepage_learning", @"homepage_history"];
    NSArray *titles = @[@"动销任务", @"日常任务", @"学习任务", @"历史业绩"];
    
    if ([GetUserDefault(UserType) isEqualToString:@"1"]) {
        
        imgs = @[@"homepage_pin", @"homepage_daily", @"homepage_learning", @"homepage_results", @"homepage_history"];
        titles = @[@"动销任务", @"日常任务", @"学习任务", @"业绩设置", @"历史业绩"];
    }
    
    for (int i = 0; i < imgs.count; i++) {
        
        UIButton *iconBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        iconBtn.frame = CGRectMake(ScreenWidth / imgs.count * i, 0, ScreenWidth / imgs.count, 95);
        [self.contentView addSubview:iconBtn];
        
        UIImageView *iconImgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 15, 40, 40)];
        iconImgView.centerX = iconBtn.width / 2;
        iconImgView.image = [UIImage imageNamed:imgs[i]];
        [iconBtn addSubview:iconImgView];
        
        UILabel *titleLabel = [[UILabel alloc] init];
        titleLabel.frame = CGRectMake(0, iconImgView.maxY + 10, iconBtn.width, 15);
        titleLabel.text = titles[i];
        titleLabel.font = [UIFont systemFontOfSize:imgs.count > 4 ? 12 : 14];
        titleLabel.textColor = kMainTextColor;
        titleLabel.textAlignment = NSTextAlignmentCenter;
        [iconBtn addSubview:titleLabel];
        
        [[iconBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
           
            NSString *vcName = @"SalesTaskViewController";
            if (i == 1) {
                vcName = @"DailyTaskViewController";
            }
            else if (i == 2) {
                vcName = @"LearningTaskViewController";
            }
            
            if (self.goViewControllerBlock) {
                
                UIViewController *vc = [NSClassFromString(vcName) new];
                vc.hidesBottomBarWhenPushed = YES;
                self.goViewControllerBlock(vc);
            }
        }];
    }
}

@end
