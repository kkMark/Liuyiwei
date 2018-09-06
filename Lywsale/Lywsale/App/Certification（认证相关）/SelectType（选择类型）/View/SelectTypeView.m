//
//  SelectTypeView.m
//  Lywsale
//
//  Created by M on 2018/8/19.
//  Copyright © 2018年 黄锡凯. All rights reserved.
//

#import "SelectTypeView.h"
#import "SelectTypeCell.h"
#import "ApplyViewController.h"
#import "UploadInfoViewController.h"

@interface SelectTypeView ()

@property (nonatomic, strong) NSMutableArray *keys;

@end

@implementation SelectTypeView

#pragma mark - set
- (void)setDictDataSource:(NSDictionary *)dictDataSource {
    
    _dictDataSource = dictDataSource;
    self.keys = [NSMutableArray arrayWithArray:dictDataSource.allKeys];
    [self.keys sortUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
        return [obj1 compare:obj2 options:NSNumericSearch];
    }];
    [self reloadData];
}


#pragma mark - tableview
- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style {
    
    if (self = [super initWithFrame:frame style:style]) {
        
        self.separatorInset = UIEdgeInsetsMake(0, 20, 0, 0);
    }
    
    return self;
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [self.dictDataSource count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.dictDataSource[self.keys[section]] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    SelectTypeCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if (cell == nil) {
        cell = [[SelectTypeCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
        cell.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0);
    }
    
    cell.userType = self.userType;
    cell.isAddNewType = NO;
    if ([self.keys[indexPath.section] isEqualToString:@""]) {
        cell.isAddNewType = YES;
    }
    
    return cell;
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    SelectTypeCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    if (cell.isAddNewType) {

        ApplyViewController *vc = [ApplyViewController new];
        vc.userType = self.userType;
        self.goViewController(vc);
    }
    else {
        
        UploadInfoViewController *vc = [UploadInfoViewController new];
        vc.userType = self.userType;
        self.goViewController(vc);
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if ([self.keys[indexPath.section] isEqualToString:@""]) {
        return 70;
    }
    
    return self.userType == PharmacyType ? 90 : 70;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
    if ([self.keys[section] isEqualToString:@""]) {
        return CGFLOAT_MIN;
    }
    
    return 30;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return CGFLOAT_MIN;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    return nil;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    UITableViewHeaderFooterView *headerView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:@"headerView"];
    if (!headerView) {
        headerView = [[UITableViewHeaderFooterView alloc] initWithReuseIdentifier:@"headerView"];
    }
    headerView.textLabel.text = self.keys[section];
    headerView.textLabel.font = [UIFont systemFontOfSize:16];
    return headerView;
}

- (NSArray<NSString *> *)sectionIndexTitlesForTableView:(UITableView *)tableView {
    return self.keys;
}

@end
