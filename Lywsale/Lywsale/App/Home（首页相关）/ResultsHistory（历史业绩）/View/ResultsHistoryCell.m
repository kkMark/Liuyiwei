//
//  ResultsHistoryCell.m
//  Lywsale
//
//  Created by M on 2018/9/25.
//  Copyright © 2018年 黄锡凯. All rights reserved.
//

#import "ResultsHistoryCell.h"

@interface ResultsHistoryCell ()

@property (nonatomic, strong) UIView *headerView;

@end

@implementation ResultsHistoryCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setupSubviews];
    }
    
    return self;
}

- (void)setupSubviews {
    
    self.headerView = [[UIView alloc] initWithFrame:CGRectMake(15, 0, ScreenWidth - 30, 0)];
    self.headerView.backgroundColor = [UIColor whiteColor];
    self.headerView.layer.cornerRadius = 2;
    self.headerView.layer.shadowColor = [UIColor grayColor].CGColor;
    self.headerView.layer.shadowOffset = CGSizeMake(3, 3);
    self.headerView.layer.shadowOpacity = 0.3;
    [self.contentView addSubview:self.headerView];
    
    // 日期
    UIImage *timeBgImg = [UIImage imageNamed:@"salesclerk-bgImg"];
    UIImageView *imgBgView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 0, 0, 0)];
    imgBgView.image = timeBgImg;
    imgBgView.size = timeBgImg.size;
    [self.headerView addSubview:imgBgView];
    
    UILabel *dateLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, imgBgView.width, imgBgView.height)];
    dateLabel.text = @"2018-05";
    dateLabel.font = [UIFont systemFontOfSize:18];
    dateLabel.textColor = [UIColor whiteColor];
    dateLabel.textAlignment = NSTextAlignmentCenter;
    [imgBgView addSubview:dateLabel];
    
    // 店员明细
    UIButton *detailBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    detailBtn.frame = CGRectMake(0, 10, 70, 30);
    detailBtn.x = self.headerView.width - 70;
    detailBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    [detailBtn setTitle:@"店员明细" forState:UIControlStateNormal];
    [detailBtn setTitleColor:kMainColor forState:UIControlStateNormal];
    [[detailBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
//        [self goViewController:@"SalesclerkViewController"];
    }];
    [self addSubview:detailBtn];
    
    // 圆
    UIView *salesLabel = [[UIView alloc] init];
    salesLabel.frame = CGRectMake(30, imgBgView.maxY + 30, 136, 136);
    salesLabel.layer.cornerRadius = salesLabel.height / 2;
    salesLabel.layer.masksToBounds = YES;
    salesLabel.layer.borderWidth = 8;
    salesLabel.layer.borderColor = [UIColor colorWithHexString:@"0xE8E8EE"].CGColor;
    [self.headerView addSubview:salesLabel];
    
    // 完成百分比
    UILabel *completionLabel = [[UILabel alloc] init];
    completionLabel.frame = CGRectMake(0, 0, salesLabel.width, 60);
    completionLabel.text = @"47%";
    completionLabel.font = [UIFont systemFontOfSize:14];
    completionLabel.textColor = [UIColor colorWithHexString:@"0xF6733E"];
    completionLabel.textAlignment = NSTextAlignmentCenter;
    completionLabel.centerX = salesLabel.width / 2;
    completionLabel.centerY = salesLabel.height / 2;
    [salesLabel addSubview:completionLabel];
    
    NSMutableAttributedString *attStr = [[NSMutableAttributedString alloc] initWithString:completionLabel.text];
    [attStr addAttribute:NSFontAttributeName value:[UIFont boldSystemFontOfSize:39] range:NSMakeRange(0, 2)];
    completionLabel.attributedText = attStr;
    
    // 完成目标
    float y = imgBgView.maxY + 40;
    for (int i = 0; i < 2; i++) {
        
        UILabel *numberTitleLabel = [[UILabel alloc] init];
        numberTitleLabel.frame = CGRectMake(ScreenWidth - 140, y, 140, 0);
        numberTitleLabel.text = i == 0 ? @"目标（元）" : @"达成（元）";
        numberTitleLabel.font = [UIFont systemFontOfSize:14];
        numberTitleLabel.textColor = [UIColor colorWithHexString:@"0x666666"];
        numberTitleLabel.height = [numberTitleLabel getTextHeight];
        [self.headerView addSubview:numberTitleLabel];
        
        UILabel *numberLabel = [[UILabel alloc] init];
        numberLabel.frame = numberTitleLabel.frame;
        numberLabel.text = @"15000.00";
        numberLabel.font = kNumberFont(22);
        numberLabel.textColor = kMainTextColor;
        numberLabel.y = numberTitleLabel.maxY + 10;
        numberLabel.height = [numberLabel getTextHeight];
        [self.headerView addSubview:numberLabel];
        
        y = numberLabel.maxY + 25;
    }
    
    NSArray *titles = @[@"订单数", @"客单价", @"可用金额"];
    UIButton *bgBtn;
    for (int i = 0; i < 3; i++) {
        
        bgBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        bgBtn.frame = CGRectMake(self.headerView.width / 3 * i, salesLabel.maxY, self.headerView.width / 3, 0);
        [self.headerView addSubview:bgBtn];
        
        UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 24, bgBtn.width, 15)];
        titleLabel.text = titles[i];
        titleLabel.font = [UIFont boldSystemFontOfSize:14];
        titleLabel.textColor = [UIColor colorWithHexString:@"0x666666"];
        titleLabel.textAlignment = NSTextAlignmentCenter;
        [bgBtn addSubview:titleLabel];
        
        UILabel *typeNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, titleLabel.maxY + 13, bgBtn.width, 15)];
        typeNameLabel.text = @"300";
        typeNameLabel.font = kNumberFont(22);
        typeNameLabel.textColor = kMainTextColor;
        typeNameLabel.textAlignment = NSTextAlignmentCenter;
        [bgBtn addSubview:typeNameLabel];
        
        bgBtn.height = typeNameLabel.maxY + 18;
    }
    
    self.headerView.height = bgBtn.maxY;
    self.cellHeight = self.headerView.height;
}

@end
