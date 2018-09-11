//
//  CustomerInfoViewController.m
//  Lywsale
//
//  Created by M on 2018/9/11.
//  Copyright © 2018年 黄锡凯. All rights reserved.
//

#import "CustomerInfoViewController.h"
#import "CustomerInfoView.h"

@interface CustomerInfoViewController ()

@property (nonatomic, strong) CustomerInfoView *customerInfoView;

@end

@implementation CustomerInfoViewController
@synthesize customerInfoView;

- (void)viewDidLoad {
    
    [super viewDidLoad];

}

- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];

    self.customerInfoView.dataSources = @[@"病种：", @"性别：", @"年龄：", @"权益：", @"积分：", @"顾客价值：", @"促销偏好：", @"最近一次消费：", @"购买次数：", @"客户价："];
}

- (CustomerInfoView *)customerInfoView {
    
    if (!customerInfoView) {
        
        customerInfoView = [[CustomerInfoView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, self.view.height + 45) style:UITableViewStyleGrouped];
        customerInfoView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [self.view addSubview:customerInfoView];
    }
    
    return customerInfoView;
}

@end
