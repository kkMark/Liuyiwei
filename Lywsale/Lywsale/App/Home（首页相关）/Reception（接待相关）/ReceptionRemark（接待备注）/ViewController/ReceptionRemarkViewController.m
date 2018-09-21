//
//  ReceptionRemarkViewController.m
//  Lywsale
//
//  Created by M on 2018/9/22.
//  Copyright © 2018年 黄锡凯. All rights reserved.
//

#import "ReceptionRemarkViewController.h"
#import "ReceptionRemarkView.h"

@interface ReceptionRemarkViewController ()

@property (nonatomic, strong) ReceptionRemarkView *remarkView;

@end

@implementation ReceptionRemarkViewController
@synthesize remarkView;

- (void)viewDidLoad {

    [super viewDidLoad];
    self.title = @"接待备注";

    self.remarkView.dataSources = @[@"接待状态", @"未成交原因", @"接待备注"];
}

- (ReceptionRemarkView *)remarkView {
    
    if (!remarkView) {
        
        remarkView = [[ReceptionRemarkView alloc] initWithFrame:self.view.frame style:UITableViewStyleGrouped];
        remarkView.height = ScreenHeight - self.navHeight;
        [self.view addSubview:remarkView];
    }
    
    return remarkView;
}

@end
