//
//  MyCardView.m
//  Lywsale
//
//  Created by 黄锡凯 on 2018/10/20.
//  Copyright © 2018 黄锡凯. All rights reserved.
//

#import "MyCardView.h"
#import "MyCardCell.h"

@interface MyCardView ()

@property (nonatomic, strong) UIView *footerView;

@end

@implementation MyCardView
@synthesize footerView;

#pragma mark - lazy
- (UIView *)footerView {
    
    if (!footerView) {
        
        footerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 85)];
        
        UIButton *addCardBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        addCardBtn.frame = CGRectMake(15, 40, ScreenWidth - 30, 45);
        addCardBtn.backgroundColor = kMainColor;
        addCardBtn.titleLabel.font = [UIFont systemFontOfSize:16];
        [addCardBtn setTitle:@"添加银行卡" forState:UIControlStateNormal];
        [addCardBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [footerView addSubview:addCardBtn];
    }
    
    return footerView;
}

#pragma mark - tableview
- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style {
    
    if (self = [super initWithFrame:frame style:style]) {
        
        self.tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 15)];
        self.tableFooterView = self.footerView;
        self.rowHeight = 100;
        self.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    
    return self;
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.dataSources.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    MyCardCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MyCardCell"];
    if (cell == nil) {
        
        cell = [[MyCardCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"MyCardCell"];
        cell.backgroundColor = self.backgroundColor;
    }
    
    return cell;
}


@end
