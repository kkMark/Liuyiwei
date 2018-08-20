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
@property (nonatomic, strong) UIView *footerView;

@end

@implementation AddTypeView
@synthesize titleLabel;
@synthesize footerView;

#pragma mark - lazy
- (UILabel *)titleLabel {
    
    if (!titleLabel) {
        
        titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 45)];
        titleLabel.font = [UIFont boldSystemFontOfSize:16];
        titleLabel.textColor = kMainTextColor;
        titleLabel.backgroundColor = [UIColor whiteColor];
        titleLabel.textAlignment = NSTextAlignmentCenter;
    }
    
    return titleLabel;
}

- (UIView *)footerView {
    
    if (!footerView) {
        
        footerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 55)];
        footerView.backgroundColor = [UIColor whiteColor];
        
        // 确定按钮
        UIButton *okBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        okBtn.backgroundColor = kMainColor;
        okBtn.frame = CGRectMake(15, footerView.height - 40, ScreenWidth - 30, 40);
        okBtn.layer.cornerRadius = okBtn.height / 2;
        okBtn.layer.masksToBounds = YES;
        okBtn.titleLabel.font = [UIFont boldSystemFontOfSize:15];
        [okBtn setTitle:@"下一步" forState:UIControlStateNormal];
        [okBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [footerView addSubview:okBtn];
        
        @weakify(self);
        [[okBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
           
            @strongify(self);
            if (self.goViewController) {

                SelectTypeViewController *vc = [SelectTypeViewController new];
                vc.userType = self.type;
                self.goViewController(vc);
            }
        }];
    }
    
    return footerView;
}

#pragma mark - set
- (void)setType:(RegisteredUserType)type {
    
    _type = type;
    
    // 药店
    if (type == PharmacyType) {
        
        self.titleLabel.text = @"选择药店地址";
        self.dataSources = @[@"请选择所在省市", @"请选择所在街道", @"请选择所在药店"];
    }
    // 连锁
    else if (type == ChainType) {
        
        self.titleLabel.text = @"选择连锁地址";
        self.dataSources = @[@"请选择所在省市", @"请选择所在街道", @"请选择所在连锁"];
    }
    // 药企
    else {
        
        self.titleLabel.text = @"选择药企地址";
        self.dataSources = @[@"请选择所在省市", @"请选择所在街道", @"请选择所在药企"];
    }
}


#pragma mark - tableview
- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style {
    
    if (self = [super initWithFrame:frame style:style]) {
        
        self.tableHeaderView = self.titleLabel;
        self.tableFooterView = self.footerView;
        self.scrollEnabled = NO;
    }
    
    return self;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [super tableView:tableView cellForRowAtIndexPath:indexPath];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}

@end
