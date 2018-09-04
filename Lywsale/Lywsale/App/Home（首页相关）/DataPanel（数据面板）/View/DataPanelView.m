//
//  DataPanelView.m
//  Lywsale
//
//  Created by M on 2018/8/28.
//  Copyright © 2018年 黄锡凯. All rights reserved.
//

#import "DataPanelView.h"
#import "DataPanelTitleCell.h"
#import "DataPanelCell.h"

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
        
        self.timeLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 50)];
        self.timeLabel.text = @"本月还剩16日";
        self.timeLabel.font = [UIFont systemFontOfSize:14];
        self.timeLabel.textColor = [UIColor redColor];
        self.timeLabel.textAlignment = NSTextAlignmentCenter;
        [headerView addSubview:self.timeLabel];
        
        UILabel *salesLabel = [[UILabel alloc] initWithFrame:CGRectMake(30, self.timeLabel.maxY, 80, 80)];
        salesLabel.backgroundColor = kMainColor;
        salesLabel.layer.cornerRadius = salesLabel.height / 2;
        salesLabel.layer.masksToBounds = YES;
        [headerView addSubview:salesLabel];

        for (int i = 0; i < 2; i++) {
            
            UILabel *numberLabel = [[UILabel alloc] initWithFrame:CGRectMake(salesLabel.maxX + 30, 0, 0, 30)];
            numberLabel.y = salesLabel.centerY - (i == 0 ? numberLabel.height : 0);
            numberLabel.width = ScreenWidth - numberLabel.x;
            numberLabel.text = i == 0 ? @"目标：15000元" : @"达成：7500元";
            numberLabel.font = [UIFont boldSystemFontOfSize:18];
            numberLabel.textColor = kMainTextColor;
            [headerView addSubview:numberLabel];
            
            NSMutableAttributedString *attStr = [[NSMutableAttributedString alloc] initWithString:numberLabel.text];
            [attStr addAttribute:NSForegroundColorAttributeName value:kMainColor range:NSMakeRange(0, 3)];
            numberLabel.attributedText = attStr;
        }
        
        // 线
        UIView *lineView = [[UILabel alloc] initWithFrame:CGRectMake(0, salesLabel.maxY + 30, ScreenWidth, 0.3)];
        lineView.backgroundColor = kLineColor;
        [headerView addSubview:lineView];
        
        NSArray *titles = @[@"订单数", @"客单价", @"可用金额"];
        UIButton *bgBtn;
        for (int i = 0; i < 3; i++) {
            
            bgBtn = [UIButton buttonWithType:UIButtonTypeCustom];
            bgBtn.frame = CGRectMake(ScreenWidth / 3 * i, lineView.maxY, ScreenWidth / 3, 0);
            [headerView addSubview:bgBtn];
            
            UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 15, bgBtn.width, 15)];
            titleLabel.text = titles[i];
            titleLabel.font = [UIFont boldSystemFontOfSize:14];
            titleLabel.textColor = kMainColor;
            titleLabel.textAlignment = NSTextAlignmentCenter;
            [bgBtn addSubview:titleLabel];
            
            UILabel *typeNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, titleLabel.maxY + 10, bgBtn.width, 15)];
            typeNameLabel.text = @"300";
            typeNameLabel.font = [UIFont boldSystemFontOfSize:14];
            typeNameLabel.textColor = kMainTextColor;
            typeNameLabel.textAlignment = NSTextAlignmentCenter;
            [bgBtn addSubview:typeNameLabel];
            
            bgBtn.height = typeNameLabel.maxY + 15;
        }
        
        headerView.height = bgBtn.maxY;
        for (int i = 0; i < 2; i++) {
            
            UIView *lineView = [[UILabel alloc] initWithFrame:CGRectMake(0, (headerView.height - 0.3) * i, ScreenWidth, 0.3)];
            lineView.backgroundColor = kLineColor;
            [headerView addSubview:lineView];
        }
    }
    
    return headerView;
}


#pragma mark - tableview
- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style {
    
    if (self = [super initWithFrame:frame style:style]) {
        
        self.tableHeaderView = self.headerView;
        [self registerClass:[DataPanelTitleCell class] forCellReuseIdentifier:@"DataPanelTitleCell"];
        [self registerClass:[DataPanelCell class] forCellReuseIdentifier:@"DataPanelCell"];
    }
    
    return self;
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSources.count + 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.row == 0) {
        
        DataPanelTitleCell *cell = [tableView dequeueReusableCellWithIdentifier:@"DataPanelTitleCell"];
        cell.separatorInset = UIEdgeInsetsMake(0, 0, 0, ScreenWidth);
        return cell;
    }
    
    DataPanelCell *cell = [tableView dequeueReusableCellWithIdentifier:@"DataPanelCell"];
    cell.index = indexPath.row;
    cell.separatorInset = UIEdgeInsetsMake(0, ScreenWidth, 0, 0);
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return indexPath.row == 0 ? 45 : 55;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return CGFLOAT_MIN;
}

@end
