//
//  AddTypeView.m
//  Lywsale
//
//  Created by M on 2018/8/19.
//  Copyright © 2018年 黄锡凯. All rights reserved.
//

#import "AddTypeView.h"
#import "SelectTypeViewController.h"

@interface AddTypeView ()

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *nameLabel;

@end

@implementation AddTypeView
@synthesize titleLabel;

#pragma mark - lazy
- (UILabel *)titleLabel {
    
    if (!titleLabel) {
        
        titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 45)];

        self.nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, 0, ScreenWidth - 30, 45)];
        self.nameLabel.font = [UIFont systemFontOfSize:16];
        self.nameLabel.textColor = kMainTextColor;
        [titleLabel addSubview:self.nameLabel];
    }
    
    return titleLabel;
}

#pragma mark - set
- (void)setType:(RegisteredUserType)type {
    
    _type = type;
    
    // 药店
    if (type == PharmacyType) {
        
        self.nameLabel.text = @"选择药店地址";
        self.dataSources = @[@"请选择所在省市", @"请选择所在街道", @"请选择所在药店"];
    }
    // 连锁
    else if (type == ChainType) {
        
        self.nameLabel.text = @"选择连锁地址";
        self.dataSources = @[@"请选择所在省市", @"请选择所在街道", @"请选择所在连锁"];
    }
    // 药企
    else {
        
        self.nameLabel.text = @"选择药企地址";
        self.dataSources = @[@"请选择所在省市", @"请选择所在街道", @"请选择所在药企"];
    }
}


#pragma mark - tableview
- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style {
    
    if (self = [super initWithFrame:frame style:style]) {
        
        self.tableHeaderView = self.titleLabel;
        self.scrollEnabled = NO;
    }
    
    return self;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString *title = self.dataSources[indexPath.row];
    
    UITableViewCell *cell = [super tableView:tableView cellForRowAtIndexPath:indexPath];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.textLabel.text = title;
    
    if ([cell.textLabel.text isEqualToString:title]) {
        cell.textLabel.textColor = [UIColor colorWithHexString:@"0x999999"];
    }
    else {
        cell.textLabel.textColor = kMainTextColor;
    }
    
    return cell;
}

@end
