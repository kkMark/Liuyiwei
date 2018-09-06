//
//  WriteInfoView.m
//  Lywsale
//
//  Created by M on 2018/8/20.
//  Copyright © 2018年 黄锡凯. All rights reserved.
//

#import "WriteInfoView.h"
#import "WriteInfoTextFieldCell.h"
#import "WriteInfoTypeCell.h"
#import "WriteInfoCertificateCell.h"

@interface WriteInfoView ()

@property (nonatomic, assign) float cellHeight;
@property (nonatomic, strong) UIView *headerView;
@property (nonatomic, strong) UIView *footerView;

@end

@implementation WriteInfoView
@synthesize headerView;
@synthesize footerView;

#pragma mark - lazy
- (UIView *)headerView {
    
    if (!headerView) {
        
        headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 0)];
        headerView.backgroundColor = [UIColor colorWithHexString:@"0xFFECC0"];
        
        UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, 10, ScreenWidth - 30, 0)];
        titleLabel.text = @"正在申请认证，请先完善一下信息，以便于客服能尽快为您审核";
        titleLabel.font = [UIFont systemFontOfSize:12];
        titleLabel.textColor = [UIColor colorWithHexString:@"0xE08E1F"];
        titleLabel.height = [titleLabel getTextHeight];
        [headerView addSubview:titleLabel];
        
        headerView.height = titleLabel.maxY + 10;
    }
    
    return headerView;
}

- (UIView *)footerView {
    
    if (!footerView) {
        
        footerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 0)];
        
        UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, 20, ScreenWidth - 30, 0)];
        titleLabel.text = @"温馨提示";
        titleLabel.font = [UIFont systemFontOfSize:14];
        titleLabel.textColor = kMainTextColor;
        titleLabel.height = [titleLabel getTextHeight];
        [footerView addSubview:titleLabel];
        
        UILabel *contentLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, titleLabel.maxY + 15, ScreenWidth - 30, 0)];
        contentLabel.text = @"填写真实资料，可以确保您能尽快顺利通过审核，并加入到六医卫进行各种动销活动，避免因资料不实带来不必要的麻烦（如，审核时间过长、奖励无法提现、到账等），对违规操作导致的异常数据，六医卫有权取消通过本应用获取的所有奖励。";
        contentLabel.font = [UIFont systemFontOfSize:10];
        contentLabel.textColor = [UIColor colorWithHexString:@"0x666666"];
        contentLabel.numberOfLines = 0;
        contentLabel.height = [contentLabel getTextHeight];
        [footerView addSubview:contentLabel];
        
        footerView.height = contentLabel.maxY + 20;
    }
    
    return footerView;
}


#pragma mark - tableview
- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style {
    
    if (self = [super initWithFrame:frame style:style]) {
        
        NSArray *cellNames = @[@"WriteInfoTextFieldCell",
                               @"WriteInfoTypeCell",
                               @"WriteInfoCertificateCell"];
        for (int i = 0; i < cellNames.count; i++) {
            [self registerClass:[NSClassFromString(cellNames[i]) class] forCellReuseIdentifier:cellNames[i]];
        }
        
        self.tableHeaderView = self.headerView;
        self.tableFooterView = self.footerView;
    }
    
    return self;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSources.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    NSString *title = self.dataSources[indexPath.row];
    // 判断是否选择类型
    if ([title isEqualToString:@"我是"]) {
        
        WriteInfoTypeCell *cell = [tableView dequeueReusableCellWithIdentifier:@"WriteInfoTypeCell"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        [cell setSelectBlock:^(NSInteger index) {
            [self endEditing:YES];
        }];
        return cell;
    }
    
    // 判断是否工作证
    if ([title isEqualToString:@"工作证"]) {
        
        WriteInfoCertificateCell *cell = [tableView dequeueReusableCellWithIdentifier:@"WriteInfoCertificateCell"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        self.cellHeight = cell.cellHeight;
        return cell;
    }
    
    // 输入框
    WriteInfoTextFieldCell *cell = [tableView dequeueReusableCellWithIdentifier:@"WriteInfoTextFieldCell"];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    if ([title isEqualToString:@"姓名"]) {
        cell.title = title;
        cell.placeholder = @"请填写真实姓名";
        
    }
    else {
        cell.title = title;
        cell.placeholder = @"请填写邀请码（选填）";
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self endEditing:YES];
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return CGFLOAT_MIN;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString *title = self.dataSources[indexPath.row];
    if ([title isEqualToString:@"工作证"]) {
        return self.cellHeight;
    }
    
    return 45;
}

@end
