//
//  SalesTaskCell.m
//  Lywsale
//
//  Created by M on 2018/8/28.
//  Copyright © 2018年 黄锡凯. All rights reserved.
//

#import "SalesTaskCell.h"

@interface SalesTaskCell ()

/// 图标
@property (nonatomic, strong) UIImageView *iconImgView;
/// 标题
@property (nonatomic, strong) UILabel *titleLabel;
/// 时间
@property (nonatomic, strong) UILabel *timeLabel;
/// 执行方式
@property (nonatomic, strong) UILabel *wayLabel;
/// 执行收益
@property (nonatomic, strong) UILabel *earningsLabel;
/// 截止时间
@property (nonatomic, strong) UILabel *stopTImeLabel;
/// 内部任务
@property (nonatomic, strong) UILabel *internalLabel;
/// 操作按钮
@property (nonatomic, strong) UIButton *operationBtn;

@end

@implementation SalesTaskCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self setupSubviews];
    }
    
    return self;
}

- (void)setupSubviews {
    
    float spacing = 15;
    
    UIView *bgView = [[UIView alloc] initWithFrame:CGRectMake(20, 0, ScreenWidth - 40, 0)];
    bgView.backgroundColor = [UIColor whiteColor];
    bgView.layer.cornerRadius = 5;
    bgView.layer.masksToBounds = YES;
    bgView.layer.borderWidth = 1;
    bgView.layer.borderColor = kLineColor.CGColor;
    [self.contentView addSubview:bgView];
    
    // 图标
    self.iconImgView = [[UIImageView alloc] initWithFrame:CGRectMake(spacing, spacing, 20, 18)];
    self.iconImgView.image = [UIImage imageNamed:@"TestTaskImg"];
    [bgView addSubview:self.iconImgView];
    
    // 时间
    self.timeLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 0, 20)];
    self.timeLabel.centerY = self.iconImgView.centerY;
    self.timeLabel.text = @"2018-05-18 18:11";
    self.timeLabel.font = [UIFont systemFontOfSize:12];
    self.timeLabel.textColor = [UIColor lightGrayColor];
    self.timeLabel.width = [self.timeLabel getTextWidth];
    self.timeLabel.x = bgView.width - self.timeLabel.width - 10;
    [bgView addSubview:self.timeLabel];
    
    // 标题
    self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.iconImgView.maxX + 10, 0, 0, 20)];
    self.titleLabel.centerY = self.iconImgView.centerY;
    self.titleLabel.text = @"博路定动销任务";
    self.titleLabel.font = [UIFont boldSystemFontOfSize:14];
    self.titleLabel.textColor = kMainTextColor;
    self.titleLabel.width = bgView.width - self.titleLabel.x - self.timeLabel.width;
    [bgView addSubview:self.titleLabel];
    
    // 操作按钮
    self.operationBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.operationBtn.frame = CGRectMake(bgView.width - spacing - 70, 0, 70, 30);
    self.operationBtn.backgroundColor = kMainColor;
    self.operationBtn.layer.cornerRadius = 5;
    self.operationBtn.layer.masksToBounds = YES;
    self.operationBtn.titleLabel.font = [UIFont boldSystemFontOfSize:14];
    [self.operationBtn setTitle:@"去执行" forState:UIControlStateNormal];
    [self.operationBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [bgView addSubview:self.operationBtn];
    
    // 内部任务
    self.internalLabel = [[UILabel alloc] initWithFrame:self.operationBtn.frame];
    self.internalLabel.height = 15;
    self.internalLabel.text = @"内部任务";
    self.internalLabel.font = [UIFont systemFontOfSize:14];
    self.internalLabel.textColor = kMainTextColor;
    self.internalLabel.textAlignment = NSTextAlignmentCenter;
    self.internalLabel.hidden = YES;
    [bgView addSubview:self.internalLabel];
    
    
    // 分割线
    UIView *lineView = [[UILabel alloc] initWithFrame:CGRectMake(0, self.iconImgView.maxY + spacing, ScreenWidth, 0.3)];
    lineView.backgroundColor = kLineColor;
    [bgView addSubview:lineView];
    
    NSArray *titles = @[@"执行方式：晒票", @"执行收益：1-3元/张", @"截止时间：2018-06-18 24:00"];
    for (int i = 0; i < 3; i++) {
        
        UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(spacing, (lineView.maxY + spacing) + (25 * i), ScreenWidth / 3 * 2, 15)];
        titleLabel.text = titles[i];
        titleLabel.font = [UIFont systemFontOfSize:14];
        titleLabel.textColor = kMainTextColor;
        [bgView addSubview:titleLabel];
        
        if (i == 1) {
            
            self.operationBtn.centerY = titleLabel.centerY;
            self.internalLabel.y = self.operationBtn.y - 20;
        }
        
        bgView.height = titleLabel.maxY + spacing;
    }
    
    self.cellHeight = bgView.height;
}

@end
