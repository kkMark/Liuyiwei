//
//  OrderManagementViewController.m
//  Lywsale
//
//  Created by 尚洋 on 2018/10/9.
//  Copyright © 2018年 黄锡凯. All rights reserved.
//

#import "OrderManagementViewController.h"
#import "NinaPagerView.h"
#import "OrderManageListViewController.h"

@interface OrderManagementViewController ()<NinaPagerViewDelegate>

@end

@implementation OrderManagementViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"订单管理";
    
    [self addChildViewController];
    
    [self initUI];
    
}

-(void)addChildViewController{
    
    OrderManageListViewController *VC = [[OrderManageListViewController alloc] init];
    VC.type = 0;
    [self addChildViewController:VC];
    
    OrderManageListViewController *VC1 = [[OrderManageListViewController alloc] init];
    VC1.type = 1;
    [self addChildViewController:VC1];
    
    OrderManageListViewController *VC2 = [[OrderManageListViewController alloc] init];
    VC2.type = 2;
    [self addChildViewController:VC2];
    
    OrderManageListViewController *VC3 = [[OrderManageListViewController alloc] init];
    VC3.type = 3;
    [self addChildViewController:VC3];
    
    OrderManageListViewController *VC4 = [[OrderManageListViewController alloc] init];
    VC4.type = 4;
    [self addChildViewController:VC4];
    
    
}

-(void)initUI{
    
    NSArray *titleArray = @[@"全部",@"待付款",@"待收货",@"已完成",@"已取消"];
    
    NinaPagerView *ninaPagerView = [[NinaPagerView alloc] initWithFrame:CGRectMake(0, 88, ScreenWidth, ScreenHeight) WithTitles:titleArray WithObjects:self.childViewControllers];
    ninaPagerView.ninaPagerStyles = NinaPagerStyleBottomLine;
    ninaPagerView.nina_navigationBarHidden = NO;
    ninaPagerView.selectTitleColor = RGB(81, 103, 241);
    ninaPagerView.unSelectTitleColor = [UIColor blackColor];
    ninaPagerView.underlineColor = RGB(81, 103, 241);
    ninaPagerView.selectBottomLinePer = 0.8;
    ninaPagerView.delegate = self;
    [self.view addSubview:ninaPagerView];
    
    ninaPagerView.sd_layout
    .leftSpaceToView(self.view, 0)
    .rightSpaceToView(self.view, 0)
    .topSpaceToView(self.view, 0)
    .bottomSpaceToView(self.view, 0 + kTabbarSafeBottomMargin);
    
}

- (void)ninaCurrentPageIndex:(NSInteger)currentPage currentObject:(id)currentObject lastObject:(id)lastObject{
    
}

@end
