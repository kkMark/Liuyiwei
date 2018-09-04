//
//  BaseTableView.m
//  GanLuXiangBan
//
//  Created by M on 2018/4/30.
//  Copyright © 2018年 黄锡凯. All rights reserved.
//

#include <stdarg.h>
#import "BaseTableView.h"

@interface BaseTableView ()

@property (nonatomic, strong) UIActionSheet *sheet;

@end

@implementation BaseTableView
@synthesize defaultImgView;

#pragma mark - lazy
- (UIImageView *)defaultImgView {
    
    if (!defaultImgView) {
        
        UIImage *img = [UIImage imageNamed:@"AppNoData"];
        defaultImgView = [UIImageView new];
        [self addSubview:defaultImgView];
        [defaultImgView mas_makeConstraints:^(MASConstraintMaker *make) {
           
            make.center.equalTo(self);
            make.width.equalTo(@(self.width));
            make.height.equalTo(@(img.size.height + 25));
        }];
        
        UIImageView *imgView = [[UIImageView alloc] initWithImage:img];
        imgView.frame = CGRectMake(0, 0, 0, 0);
        imgView.size = img.size;
        imgView.centerX = self.width / 2;
        [defaultImgView addSubview:imgView];
        
        UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(imgView.frame) + 10, self.width, 15)];
        titleLabel.text = @"暂无数据";
        titleLabel.font = [UIFont systemFontOfSize:14];
        titleLabel.textColor = [UIColor colorWithHexString:@"0x919191"];
        titleLabel.textAlignment = NSTextAlignmentCenter;
        [defaultImgView addSubview:titleLabel];
    }
    
    return defaultImgView;
}


#pragma mark - TableView
- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        [self initializeWithFrame:frame];
    }
    
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style {
    
    if (self = [super initWithFrame:frame style:style]) {
        [self initializeWithFrame:frame];
    }
    
    return self;
}

- (void)initializeWithFrame:(CGRect)frame {
    
    // 状态栏高度
    self.statusBarHeight = [[UIApplication sharedApplication] statusBarFrame].size.height;
    
    self.tableFooterView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, CGFLOAT_MIN)];
    self.tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, CGFLOAT_MIN)];
    self.backgroundColor = kPageBgColor;
    self.rowHeight = 45;
    self.dataSource = self;
    self.delegate = self;
    self.separatorInset = UIEdgeInsetsMake(0, ScreenWidth == 320 ? 15 : 20, 0, 0);
}

#pragma mark - set
- (void)setDataSources:(NSArray *)dataSources {
    
    _dataSources = dataSources;
    self.defaultImgView.hidden = dataSources.count == 0 ? NO : YES;
    if (dataSources == nil) {
        self.defaultImgView.hidden = YES;
    }
    [self reloadData];
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSources.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"Cell"];
    }
    
    cell.textLabel.font = [UIFont systemFontOfSize:14];
    return cell;
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    
    if (section == self.dataSources.count - 1) {
        return CGFLOAT_MIN;
    }
    
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return CGFLOAT_MIN;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    return nil;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    return nil;
}

#pragma mark - UIScrollViewDelegate
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    [self.superview endEditing:YES];
}

#pragma mark - ActionSheet
- (void)actionSheetWithTitle:(NSString *)title titles:(NSArray *)titles isCan:(BOOL)isCan completeBlock:(ActionSheetCompleteBlock)actionSheetComplete {
    
    self.complete = actionSheetComplete;
    self.sheet = [[UIActionSheet alloc] initWithTitle:title delegate:self cancelButtonTitle:isCan ? @"取消" : nil destructiveButtonTitle:nil otherButtonTitles:nil];
    self.sheet.actionSheetStyle = UIActionSheetStyleDefault;
    
    for (int i = 0; i < titles.count; i++) {
        [self.sheet addButtonWithTitle:titles[i]];
    }
    
    [self.sheet showInView:self];
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    
    if (self.complete) {
        self.complete(buttonIndex);
    }
    
    [self.sheet dismissWithClickedButtonIndex:0 animated:YES];
}

// 输入框
- (void)showTitleAlertWithMsg:(NSString *)msg isCancel:(BOOL)isCancel completeBlock:(void (^)(id object))completeBlock {
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"温馨提示" message:msg preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        if (completeBlock) {
            completeBlock([alertController.textFields.lastObject text]);
        }
    }];
    
    [alertController addTextFieldWithConfigurationHandler:^(UITextField *textField) {
        textField.placeholder = msg;
    }];
    
    if (isCancel) {
        
        UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
        [alertController addAction:cancelAction];
    }
    
    [alertController addAction:okAction];
    [NavController presentViewController:alertController animated:YES completion:nil];
}

@end
