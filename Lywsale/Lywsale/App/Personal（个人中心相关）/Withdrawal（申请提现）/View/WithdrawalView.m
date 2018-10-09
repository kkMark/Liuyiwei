
//
//  WithdrawalView.m
//  Lywsale
//
//  Created by 黄锡凯 on 2018/10/9.
//  Copyright © 2018 黄锡凯. All rights reserved.
//

#import "WithdrawalView.h"
#import "AmountCell.h"
#import "TipCell.h"

@interface WithdrawalView ()

@property (nonatomic, strong) UIView *headerView;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, assign) CGFloat cellHeight;

@end

@implementation WithdrawalView
@synthesize headerView;

- (UIView *)headerView:(NSInteger)section {
    
    NSArray *titles = @[@"银行卡", @"目前可提现金额", @"提现金额"];

    headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 45)];
    headerView.backgroundColor = [UIColor whiteColor];
    
    UIView *labelView = [[UIView alloc] initWithFrame:CGRectMake(15, 15, 3, 15)];
    labelView.backgroundColor = kMainColor;
    [headerView addSubview:labelView];
    
    self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(labelView.maxX + 5, 0, 0, 20)];
    self.titleLabel.centerY = labelView.centerY;
    self.titleLabel.width = headerView.width - self.titleLabel.x - 15;
    self.titleLabel.text = titles[section];
    self.titleLabel.font = [UIFont systemFontOfSize:16];
    self.titleLabel.textColor = kMainTextColor;
    [headerView addSubview:self.titleLabel];
    
    return headerView;
}


#pragma mark - tableview
- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style {
    
    if (self = [super initWithFrame:frame style:style]) {
        
        self.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    
    return self;
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    if (section != 2) {
        return 1;
    }
    else return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 2) {
        
        if (indexPath.row == 0) {
            
            AmountCell *cell = [tableView dequeueReusableCellWithIdentifier:@"AmountCell"];
            if (cell == nil) {
                cell = [[AmountCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"AmountCell"];
            }
            
            return cell;
        }
        else {
            
            TipCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TipCell"];
            if (cell == nil) {
                cell = [[TipCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"TipCell"];
            }
            
            cell.tipContent = @"1、提现申请后，T+2（工作日）到账； \n2、如申请遇不可抗因素，如自然灾害、节假日、银行系统问题、账户问题等，打款";
            self.cellHeight = cell.tipCellHeight;
            return cell;
        }
    }
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if (cell == nil) {
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"Cell"];
        
        UIImageView *moreImgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 17, 17)];
        moreImgView.image = [UIImage imageNamed:@"more"];
        moreImgView.hidden = YES;
        cell.accessoryView = moreImgView;
        
        UILabel *detailTextLabel = [[UILabel alloc] initWithFrame:CGRectMake(ScreenWidth - ScreenWidth / 2 - 45, 0, ScreenWidth / 2, 45)];
        detailTextLabel.tag = 10000;
        detailTextLabel.text = @"6222*********3584";
        detailTextLabel.font = [UIFont systemFontOfSize:14];
        detailTextLabel.textColor = [UIColor colorWithHexString:@"0x666666"];
        detailTextLabel.textAlignment = NSTextAlignmentRight;
        detailTextLabel.hidden = YES;
        [cell addSubview:detailTextLabel];
    }
    
    cell.textLabel.text = @"工商银行";
    cell.textLabel.font = [UIFont systemFontOfSize:14];
    cell.textLabel.textColor = kMainTextColor;
    
    if (indexPath.section == 0) {
        cell.accessoryView.hidden = NO;
        [cell viewWithTag:10000].hidden = NO;
    }
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 2 && indexPath.row == 1) {
        return self.cellHeight;
    }
    
    return 45;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 45;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    return [self headerView:section];
}

@end
