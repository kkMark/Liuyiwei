//
//  AddCardView.m
//  GanLuXiangBan
//
//  Created by M on 2018/6/3.
//  Copyright © 2018年 黄锡凯. All rights reserved.
//

#import "AddCardView.h"
#import "SelectPriceView.h"

@interface AddCardView ()

@property (nonatomic, strong) SelectPriceView *selectPriceView;

@end

@implementation AddCardView
@synthesize selectPriceView;

- (SelectPriceView *)selectPriceView {
    
    if (!selectPriceView) {
        
        selectPriceView = [[SelectPriceView alloc] initWithFrame:CGRectMake(0, 0, self.width, self.height)];
        selectPriceView.priceArr = self.bankList;
        [self addSubview:selectPriceView];
        
        @weakify(self);
        [selectPriceView setDidTextStringBlock:^(NSString *textString) {
            
            @strongify(self);
            AddCardCell *cell = [self cellForRowAtIndexPath:[NSIndexPath indexPathForRow:1 inSection:0]];
            cell.textFieldText.text = textString;
        }];
    }
    
    return selectPriceView;
}

#pragma mark - tableView
- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style {
    
    if (self = [super initWithFrame:frame style:style]) {
        
        self.scrollEnabled = NO;
        [self registerClass:[AddCardCell class] forCellReuseIdentifier:@"AddCardCell"];
    }
    
    return self;
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    AddCardCell *cell = [tableView dequeueReusableCellWithIdentifier:@"AddCardCell"];
    
    NSArray *arr = @[@"持卡人", @"银行", @"卡号"];
    cell.titleLabel.text = arr[indexPath.row];
    cell.textFieldText.enabled = NO;
    if (indexPath.row == 0) {
        cell.textFieldText.text = GetUserDefault(UserName);
    }
    else if (indexPath.row == 1) {
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.selectionStyle = UITableViewCellSelectionStyleDefault;
        cell.textFieldText.text = @"请选择对应的银行";
    }
    else {
        cell.textFieldText.enabled = YES;
        cell.textFieldText.placeholder = @"请输入银行卡号";
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [super tableView:tableView didSelectRowAtIndexPath:indexPath];
    if (indexPath.row == 1) {
        
        self.selectPriceView.hidden = NO;
        self.selectPriceView.isShowList = YES;
    }
}


@end
