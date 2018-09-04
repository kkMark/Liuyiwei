//
//  PersonalView.m
//  Lywsale
//
//  Created by M on 2018/8/22.
//  Copyright © 2018年 黄锡凯. All rights reserved.
//

#import "PersonalView.h"

@interface PersonalView ()

@property (nonatomic, strong) UIView *headerView;
@property (nonatomic, strong) UIImageView *headImgView;
@property (nonatomic, strong) UILabel *nameLabel;

@end

@implementation PersonalView
@synthesize headerView;

#pragma mark - lazy
- (UIView *)headerView {
    
    if (!headerView) {
        
        headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 0)];
        headerView.backgroundColor = [UIColor whiteColor];
        
        // 头像
        self.headImgView = [[UIImageView alloc] initWithFrame:CGRectMake(15, 15, 60, 60)];
        self.headImgView.height = self.headImgView.width = 50;
        self.headImgView.layer.cornerRadius = self.headImgView.height / 2;
        self.headImgView.layer.masksToBounds = YES;
        self.headImgView.image = [UIImage imageNamed:@"TestHeadImg"];
        self.headImgView.contentMode = UIViewContentModeScaleAspectFill;
        [headerView addSubview:self.headImgView];
        
        // 昵称
        self.nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.headImgView.maxX + 15, 25, ScreenWidth - (self.headImgView.maxX + 30), 15)];
        self.nameLabel.text = GetUserDefault(UserName);
        self.nameLabel.font = [UIFont boldSystemFontOfSize:14];
        self.nameLabel.textColor = kMainTextColor;
        [headerView addSubview:self.nameLabel];
        
        UILabel *xxLabel = [[UILabel alloc] initWithFrame:self.nameLabel.frame];
        xxLabel.y = self.nameLabel.maxY + 5;
        xxLabel.text = @"★★★★★";
        xxLabel.font = [UIFont boldSystemFontOfSize:16];
        xxLabel.textColor = kMainColor;
        [headerView addSubview:xxLabel];
        
        // 线
        UIView *lineView = [[UILabel alloc] initWithFrame:CGRectMake(0, self.headImgView.maxY + 15, ScreenWidth, 0.3)];
        lineView.backgroundColor = kLineColor;
        [headerView addSubview:lineView];
        
        NSArray *titles = @[@"总积分", @"总金额", @"可用金额"];
        UIButton *bgBtn;
        for (int i = 0; i < 3; i++) {
            
            bgBtn = [UIButton buttonWithType:UIButtonTypeCustom];
            bgBtn.frame = CGRectMake(ScreenWidth / 3 * i, lineView.maxY, ScreenWidth / 3, 0);
            [headerView addSubview:bgBtn];
            
            UILabel *numberLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 15, bgBtn.width, 15)];
            numberLabel.text = @"300";
            numberLabel.font = [UIFont boldSystemFontOfSize:14];
            numberLabel.textColor = kMainTextColor;
            numberLabel.textAlignment = NSTextAlignmentCenter;
            [bgBtn addSubview:numberLabel];
            
            UILabel *typeNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, numberLabel.maxY + 5, bgBtn.width, 15)];
            typeNameLabel.text = titles[i];
            typeNameLabel.font = [UIFont systemFontOfSize:14];
            typeNameLabel.textColor = kMainTextColor;
            typeNameLabel.textAlignment = NSTextAlignmentCenter;
            [bgBtn addSubview:typeNameLabel];
            
            bgBtn.height = typeNameLabel.maxY + 15;
            if (i != 0) {
                
                UIView *lineView = [[UILabel alloc] initWithFrame:CGRectMake(0, 10, 0.3, bgBtn.height - 20)];
                lineView.backgroundColor = kLineColor;
                [bgBtn addSubview:lineView];
            }
        }
        
        for (int i = 0; i < 2; i++) {
            
            // 底部线条
            UIView *bottomlineView = [[UILabel alloc] initWithFrame:CGRectMake(0, bgBtn.maxY * i, ScreenWidth, 0.3)];
            bottomlineView.backgroundColor = kLineColor;
            [headerView addSubview:bottomlineView];
        }
        
        headerView.height = self.headImgView.maxY + self.headImgView.x + bgBtn.height;
    }
    
    return headerView;
}

#pragma mark - tableview
- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style {
    
    if (self = [super initWithFrame:frame style:style]) {
        
        self.tableHeaderView = self.headerView;
    }
    
    return self;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [super tableView:tableView cellForRowAtIndexPath:indexPath];
    cell.textLabel.text = self.dataSources[indexPath.row];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 10;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [super tableView:tableView didSelectRowAtIndexPath:indexPath];
    
    NSString *title = self.dataSources[indexPath.row];
    NSString *vcName;
    if ([title containsString:@"足迹"]) {
        vcName = @"FootprintViewController";
    }
    else if ([title containsString:@"档案"]) {
        vcName = @"ArchivesViewController";
    }
    else if ([title containsString:@"银行卡"]) {
        vcName = @"MyCardViewController";
    }
    else if ([title containsString:@"帮助"]) {
        vcName = @"HelpViewController";
    }
    else if ([title containsString:@"更多"]) {
        vcName = @"MoreViewController";
    }
    else if ([title containsString:@"切换"] && self.conversionBlock) {
        return self.conversionBlock();
    }
    
    if (self.goViewController && vcName.length > 0) {
        
        UIViewController *vc = [NSClassFromString(vcName) new];
        vc.title = title;
        vc.hidesBottomBarWhenPushed = YES;
        self.goViewController(vc);
    }
}

@end
