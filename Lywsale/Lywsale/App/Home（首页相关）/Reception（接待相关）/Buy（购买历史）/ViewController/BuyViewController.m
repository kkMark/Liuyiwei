//
//  BuyViewController.m
//  Lywsale
//
//  Created by M on 2018/9/11.
//  Copyright © 2018年 黄锡凯. All rights reserved.
//

#import "BuyViewController.h"
#import "BuyView.h"

@interface BuyViewController ()

@property (nonatomic, strong) BuyView *buyView;
@property (nonatomic, strong) UIButton *addBuyBtn;

@end

@implementation BuyViewController
@synthesize buyView;
@synthesize addBuyBtn;

- (void)viewDidLoad {

    [super viewDidLoad];

}

- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    
    self.buyView.dataSources = @[@"", @"", @""];
}

- (BuyView *)buyView {
    
    if (!buyView) {
    
        buyView = [[BuyView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, self.view.height - self.addBuyBtn.height) style:UITableViewStyleGrouped];
        buyView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [self.view addSubview:buyView];
    }
    
    return buyView;
}

- (UIButton *)addBuyBtn {
    
    if (!addBuyBtn) {
        
        addBuyBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        addBuyBtn.frame = CGRectMake(0, self.view.height - 45, ScreenWidth , 45);
        addBuyBtn.backgroundColor = kMainColor;
        addBuyBtn.titleLabel.font = [UIFont systemFontOfSize:16];
        [addBuyBtn setTitle:@"新增购买" forState:UIControlStateNormal];
        [addBuyBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [self.view addSubview:addBuyBtn];
    }
    
    return addBuyBtn;
}

@end
