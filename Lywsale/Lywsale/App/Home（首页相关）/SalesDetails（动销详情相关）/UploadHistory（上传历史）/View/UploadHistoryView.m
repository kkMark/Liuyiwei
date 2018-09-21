//
//  UploadHistoryView.m
//  Lywsale
//
//  Created by M on 2018/9/21.
//  Copyright © 2018年 黄锡凯. All rights reserved.
//

#import "UploadHistoryView.h"
#import "UploadHistoryCell.h"

@implementation UploadHistoryView

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style {
    
    if (self = [super initWithFrame:frame style:style]) {
        
        self.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    
    return self;
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.dataSources.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.row == 0) {
        
        UITableViewCell *cell = [super tableView:tableView cellForRowAtIndexPath:indexPath];
        cell.backgroundColor = self.backgroundColor;
        cell.textLabel.text = @"2018-08-02";
        cell.textLabel.textColor = kMainTextColor;
        return cell;
    }
    
    UploadHistoryCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UploadHistoryCell"];
    if (cell == nil) {
        cell = [[UploadHistoryCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"UploadHistoryCell"];
    }
    
    cell.backgroundColor = self.backgroundColor;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.row == 1) {
        return (ScreenWidth - 90) / 3 + 70;
    }
    
    return 45;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    
    return CGFLOAT_MIN;
}

@end
