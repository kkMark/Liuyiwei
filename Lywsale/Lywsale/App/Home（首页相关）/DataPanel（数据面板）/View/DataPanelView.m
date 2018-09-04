//
//  DataPanelView.m
//  Lywsale
//
//  Created by M on 2018/8/28.
//  Copyright © 2018年 黄锡凯. All rights reserved.
//

#import "DataPanelView.h"
#import "RankingCell.h"
#import "TaskTypeCell.h"
#import "MyRankingCell.h"

@interface DataPanelView ()

@property (nonatomic, strong) UIView *headerView;
@property (nonatomic, strong) UILabel *timeLabel;

@end

@implementation DataPanelView
@synthesize headerView;

#pragma mark - lazy
- (UIView *)headerView {
    
    if (!headerView) {
        
        headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 0)];
        headerView.backgroundColor = [UIColor whiteColor];
        
        // 标题
        UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, 18, 70, 0)];
        titleLabel.text = @"5月数据";
        titleLabel.font = [UIFont fontWithName:@"PingFang-SC-Medium" size:18];
        titleLabel.textColor = kMainTextColor;
        titleLabel.height = [titleLabel getTextHeight];
        [headerView addSubview:titleLabel];
        
        // 时间
        self.timeLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth / 2, titleLabel.height)];
        self.timeLabel.centerY = titleLabel.centerY;
        self.timeLabel.x = ScreenWidth - self.timeLabel.width - 15;
        self.timeLabel.text = @"本月还剩 16 日";
        self.timeLabel.font = [UIFont systemFontOfSize:16];
        self.timeLabel.textColor = titleLabel.textColor;
        self.timeLabel.textAlignment = NSTextAlignmentRight;
        [headerView addSubview:self.timeLabel];
        
        NSMutableAttributedString *attStr = [[NSMutableAttributedString alloc] initWithString:self.timeLabel.text];
        [attStr addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithHexString:@"0xF6733E"] range:NSMakeRange(self.timeLabel.text.length - 4, 2)];
        self.timeLabel.attributedText = attStr;
        
        // 圆
        UIView *salesLabel = [[UIView alloc] init];
        salesLabel.frame = CGRectMake(56.5, self.timeLabel.maxY + 22, 136, 136);
        salesLabel.layer.cornerRadius = salesLabel.height / 2;
        salesLabel.layer.masksToBounds = YES;
        salesLabel.layer.borderWidth = 8;
        salesLabel.layer.borderColor = [UIColor colorWithHexString:@"0xE8E8EE"].CGColor;
        [headerView addSubview:salesLabel];
        
        float y = self.timeLabel.maxY + 30;
        for (int i = 0; i < 2; i++) {
            
            UILabel *numberTitleLabel = [[UILabel alloc] init];
            numberTitleLabel.frame = CGRectMake(ScreenWidth - 140, y, 140, 0);
            numberTitleLabel.text = i == 0 ? @"目标（元）" : @"达成（元）";
            numberTitleLabel.font = [UIFont systemFontOfSize:14];
            numberTitleLabel.textColor = [UIColor colorWithHexString:@"0x666666"];
            numberTitleLabel.height = [numberTitleLabel getTextHeight];
            [headerView addSubview:numberTitleLabel];
            
            UILabel *numberLabel = [[UILabel alloc] init];
            numberLabel.frame = numberTitleLabel.frame;
            numberLabel.text = @"15000.00";
            numberLabel.font = kNumberFont(22);
            numberLabel.textColor = kMainTextColor;
            numberLabel.y = numberTitleLabel.maxY + 10;
            numberLabel.height = [numberLabel getTextHeight];
            [headerView addSubview:numberLabel];
            
            y = numberLabel.maxY + 25;
        }
        
        NSArray *titles = @[@"订单数", @"客单价", @"可用金额"];
        UIButton *bgBtn;
        for (int i = 0; i < 3; i++) {
            
            bgBtn = [UIButton buttonWithType:UIButtonTypeCustom];
            bgBtn.frame = CGRectMake(ScreenWidth / 3 * i, salesLabel.maxY, ScreenWidth / 3, 0);
            [headerView addSubview:bgBtn];
            
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
        
        headerView.height = bgBtn.maxY;
    }
    
    return headerView;
}


#pragma mark - tableview
- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style {
    
    if (self = [super initWithFrame:frame style:style]) {
        
        self.tableHeaderView = self.headerView;
        self.separatorStyle = UITableViewCellSeparatorStyleNone;
        [self registerClass:[MyRankingCell class] forCellReuseIdentifier:@"MyRankingCell"];
        [self registerClass:[TaskTypeCell class] forCellReuseIdentifier:@"TaskTypeCell"];
        [self registerClass:[RankingCell class] forCellReuseIdentifier:@"RankingCell"];
    }
    
    return self;
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    if (section == 0) {
        return 1;
    }
    
    return self.dataSources.count + 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 0) {
        
        // 任务类型
        TaskTypeCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TaskTypeCell"];
        return cell;
    }
    else if (indexPath.section == 1) {
        
        // 标题
        if (indexPath.row == 0) {
            
            UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
            if (cell == nil) {
                
                cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
                
                UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, 0, ScreenWidth, 50)];
                titleLabel.font = [UIFont fontWithName:@"PingFang-SC-Medium" size:18];
                titleLabel.text = @"药师销售月榜";
                titleLabel.textColor = kMainTextColor;
                [cell addSubview:titleLabel];
            }
            
            return cell;
        }
        else if (indexPath.row == 1) {
         
            // 我的排名
            MyRankingCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MyRankingCell"];
            return cell;
        }
    }
    
    RankingCell *cell = [tableView dequeueReusableCellWithIdentifier:@"RankingCell"];
    cell.index = indexPath.row - 1;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 0) {
        return 95;
    }
    else if (indexPath.section == 1) {
        
        if (indexPath.row == 0) {
            return 50;
        }
    }
    
    return 65;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 5;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    
    if (section == 1) {
        return 20;
    }
    
    return CGFLOAT_MIN;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    
    UIView *footerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 20)];
    footerView.backgroundColor = [UIColor whiteColor];
    return footerView;
}

@end
