//
//  SalesSendView.m
//  Lywsale
//
//  Created by M on 2018/9/28.
//  Copyright © 2018年 黄锡凯. All rights reserved.
//

#import "SalesSendView.h"
#import "BaseTableView.h"

@interface SalesSendView () <UITableViewDelegate, UITableViewDataSource, UIActionSheetDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UIView *headView;

@end

@implementation SalesSendView
@synthesize tableView;
@synthesize headView;

- (void)setupSubviews {
    [self sendBtn];
}

- (void)setDataSource:(NSArray *)dataSource {
    [self.tableView reloadData];
}

#pragma mark - UI
- (void)sendBtn {
    
    UIButton *sendBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    sendBtn.backgroundColor = kMainColor;
    sendBtn.frame = CGRectMake(0, self.tableView.maxY, ScreenWidth, 45);
    sendBtn.titleLabel.font = [UIFont systemFontOfSize:16];
    [sendBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self addSubview:sendBtn];
    
    NSString *title = @"去上传凭证";
    if ([GetUserDefault(UserType) isEqualToString:@"1"]) {
        title = @"分发给店员";
    }
    
    [sendBtn setTitle:title forState:UIControlStateNormal];
    [[sendBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x)
    {
        
    }];
}

#pragma mark - lazy
- (UIView *)headView {
    
    if (!headView) {
        
        headView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 45)];
        
        // 选中按钮
        UIButton *selBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        selBtn.frame = CGRectMake(20, 0, 45, 45);
        [selBtn setImage:[UIImage imageNamed:@"checkbox_nor"] forState:UIControlStateNormal];
        [selBtn setImage:[UIImage imageNamed:@"checkbox_sel"] forState:UIControlStateSelected];
        [selBtn setTitle:@"全选" forState:UIControlStateNormal];
        [selBtn setTitleColor:kMainTextColor forState:UIControlStateNormal];
        [[selBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x)
        {
            UIButton *tempBtn = x;
            tempBtn.selected = !tempBtn.selected;
        }];
        [headView addSubview:selBtn];
    }
    
    return headView;
}

#pragma mark - tableview
- (UITableView *)tableView {
    
    if (!tableView) {
        
        tableView = [[UITableView alloc] initWithFrame:self.frame style:UITableViewStyleGrouped];
        tableView.height = self.height - 45;
        tableView.delegate = self;
        tableView.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0);
        tableView.separatorColor = [UIColor colorWithHexString:@"0xd1d1d1"];
        tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, CGFLOAT_MIN)];
        tableView.tableHeaderView = self.headView;
        [self addSubview:tableView];
    }
    
    return tableView;
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if (cell == nil) {
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"Cell"];
        
        UIImageView *moreImgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 17, 17)];
        moreImgView.image = [UIImage imageNamed:@"more"];
        cell.accessoryView = moreImgView;
    }
    
    cell.textLabel.font = [UIFont systemFontOfSize:14];
    return cell;
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
