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
#import "TipCell.h"

@interface WriteInfoView ()

@property (nonatomic, assign) float cellHeight;

@end

@implementation WriteInfoView

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style {
    
    if (self = [super initWithFrame:frame style:style]) {
        
        NSArray *cellNames = @[@"UITableViewCell",
                               @"WriteInfoTextFieldCell",
                               @"WriteInfoTypeCell",
                               @"WriteInfoCertificateCell",
                               @"TipCell"];
        for (int i = 0; i < cellNames.count; i++) {
            [self registerClass:[NSClassFromString(cellNames[i]) class] forCellReuseIdentifier:cellNames[i]];
        }
    }
    
    return self;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSources.count + 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // 统一进行提示
    if (indexPath.row == 0) {
        
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];
        cell.textLabel.textColor = kMainTextColor;
        cell.textLabel.font = [UIFont systemFontOfSize:14];
        cell.textLabel.text = @"正在申请认证，请先完善一下信息，以便于客服能尽快为您审核。";
        cell.textLabel.numberOfLines = 0;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
    
    if (indexPath.row == self.dataSources.count + 1) {
        
        TipCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TipCell"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.tipContent = @"填写真实资料，可以确保您能尽快顺利通过审核，并加入到六医卫进行各种动销活动，避免因资料不实带来不必要的麻烦（如，审核时间过长、奖励无法提现、到账等），对违规操作导致的异常数据，六医卫有权取消通过本应用获取的所有奖励。";
        self.cellHeight = cell.tipCellHeight;
        return cell;
    }
    
    NSString *title = self.dataSources[indexPath.row - 1];
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
    
    if (indexPath.row == 0) {
        return 60;
    }
    else if (indexPath.row == self.dataSources.count + 1) {
        return self.cellHeight;
    }
    
    return 45;
}

@end
