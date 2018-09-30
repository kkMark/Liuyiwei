//
//  SalesSendListView.m
//  Lywsale
//
//  Created by 黄锡凯 on 2018/9/30.
//  Copyright © 2018 黄锡凯. All rights reserved.
//

#import "SalesSendListView.h"
#import "SalesSendListCell.h"

@interface SalesSendListView ()

@property (nonatomic, strong) UIView *headView;
@property (nonatomic, assign) BOOL isSel;

@end


@implementation SalesSendListView
@synthesize headView;

#pragma mark - lazy
- (UIView *)headView {
    
    if (!headView) {
        
        headView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.width, 45)];
        headView.backgroundColor = [UIColor whiteColor];
        
        // 选中按钮
        UIButton *selBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        selBtn.frame = CGRectMake(30, 0, headView.width - 60, 45);
        selBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        selBtn.titleLabel.font = [UIFont systemFontOfSize:14];
        selBtn.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
        [selBtn setImage:[UIImage imageNamed:@"checkbox_nor"] forState:UIControlStateNormal];
        [selBtn setImage:[UIImage imageNamed:@"checkbox_sel"] forState:UIControlStateSelected];
        [selBtn setTitle:@"全选" forState:UIControlStateNormal];
        [selBtn setTitleColor:kMainTextColor forState:UIControlStateNormal];
        [[selBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x)
         {
             UIButton *tempBtn = x;
             tempBtn.selected = !tempBtn.selected;
         }];
        
        UILabel *numberLabel = [[UILabel alloc] initWithFrame:CGRectMake(ScreenWidth - ScreenWidth / 2 - 30, 0, ScreenWidth / 2, selBtn.height)];
        numberLabel.text = @"当前已选择4人";
        numberLabel.font = [UIFont systemFontOfSize:14];
        numberLabel.textColor = [UIColor colorWithHexString:@"0x666666"];
        numberLabel.textAlignment = NSTextAlignmentRight;
        [headView addSubview:numberLabel];
        
        [headView addSubview:selBtn];
    }
    
    return headView;
}

#pragma mark - tableview
- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style {
    
    if (self = [super initWithFrame:frame style:style]) {
        
        self.tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 15)];
        self.separatorStyle = UITableViewCellSeparatorStyleNone;
        self.rowHeight = 60;
    }
    
    return self;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    SalesSendListCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if (cell == nil) {
        cell = [[SalesSendListCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    }
    
    if (self.isSel) {
        cell.isSel = self.isSel;
    }
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 45;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {

    return self.headView;
}

@end
