//
//  SalesTaskCell.m
//  Lywsale
//
//  Created by M on 2018/8/28.
//  Copyright © 2018年 黄锡凯. All rights reserved.
//

#import "SalesTaskCell.h"

@interface SalesTaskCell ()

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
    
    UIView *bgView = [[UIView alloc] initWithFrame:CGRectMake(15, 0, ScreenWidth - 30, 0)];
    bgView.backgroundColor = [UIColor whiteColor];
    bgView.layer.cornerRadius = 2;
    bgView.layer.shadowColor = [UIColor grayColor].CGColor;
    bgView.layer.shadowOffset = CGSizeMake(3, 3);
    bgView.layer.shadowOpacity = 0.3;
    [self.contentView addSubview:bgView];
    
    UIImage *taskBgImg = [UIImage imageNamed:@""];
    UIImageView *taskBgImgView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 0, 0, 0)];
    taskBgImgView.size = taskBgImg.size;
    [self.contentView addSubview:taskBgImgView];
    
    // 标题
    self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(spacing, 0, 0, 20)];
    self.titleLabel.text = @"博路定动销任务";
    self.titleLabel.font = [UIFont boldSystemFontOfSize:14];
    self.titleLabel.textColor = kMainTextColor;
    self.titleLabel.width = bgView.width - self.titleLabel.x - self.timeLabel.width;
    [bgView addSubview:self.titleLabel];
    
    // 时间
    self.timeLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 0, 20)];
    self.timeLabel.centerY = self.titleLabel.centerY;
    self.timeLabel.text = @"2018-05-18 18:11";
    self.timeLabel.font = [UIFont systemFontOfSize:12];
    self.timeLabel.textColor = [UIColor lightGrayColor];
    self.timeLabel.width = [self.timeLabel getTextWidth];
    self.timeLabel.x = bgView.width - self.timeLabel.width - 10;
    [bgView addSubview:self.timeLabel];
    
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
    
    // 分割线
    UIView *lineView = [[UILabel alloc] initWithFrame:CGRectMake(0, self.titleLabel.maxY + spacing, bgView.width, 0.3)];
    lineView.backgroundColor = kLineColor;
    [bgView addSubview:lineView];
    
    NSArray *titles = @[@"执行方式：晒票", @"执行收益：1-3元/张", @"截止时间：2018-06-18 24:00"];
    for (int i = 0; i < 3; i++) {
        
        UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(spacing, (lineView.maxY + spacing) + (25 * i), ScreenWidth / 3 * 2, 15)];
        titleLabel.text = titles[i];
        titleLabel.font = [UIFont systemFontOfSize:14];
        titleLabel.textColor = kMainTextColor;
        [bgView addSubview:titleLabel];
        
        bgView.height = titleLabel.maxY + spacing;
    }
    
    self.cellHeight = bgView.height;
}

@end
