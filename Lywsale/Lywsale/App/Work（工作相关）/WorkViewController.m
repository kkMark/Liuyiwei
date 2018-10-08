//
//  WorkViewController.m
//  Lywsale
//
//  Created by 尚洋 on 2018/9/13.
//  Copyright © 2018年 黄锡凯. All rights reserved.
//

#import "WorkViewController.h"
#import "HomeMessgeView.h"
#import "AnnouncementViewController.h"

@interface WorkViewController ()

@property (nonatomic ,strong) UIView *choiceView;

@property (nonatomic ,copy) NSArray *titileArray;

@property (nonatomic ,strong) HomeMessgeView *homeMessgeView;

@end

@implementation WorkViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"工作";
    
    self.view.backgroundColor = kPageBgColor;
    
    [self initUI];
    
}

-(void)initUI{
    
    self.choiceView = [UIView new];
    self.choiceView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.choiceView];
    
    self.choiceView.sd_layout
    .leftSpaceToView(self.view, 0)
    .rightSpaceToView(self.view, 0)
    .topSpaceToView(self.view, 10)
    .heightRatioToView(self.view, 0.28);
    
    [self addChoice];
    
    self.homeMessgeView = [HomeMessgeView new];
    [self.view addSubview:self.homeMessgeView];
    
    self.homeMessgeView.sd_layout
    .leftSpaceToView(self.view, 0)
    .rightSpaceToView(self.view, 0)
    .topSpaceToView(self.choiceView, 10)
    .bottomSpaceToView(self.view, 0);
    
}

-(void)addChoice{
    
    self.titileArray = @[@"代开单",@"扫码提货",@"订单管理",@"会员管理",@"我的奖励",@"公告信息",@"二维码",@"店员管理"];
    
    NSArray *imageArray = @[@"Work_Order",@"Work_Goods",@"Work_OrderManagement",@"Work_MemberManagement",@"Work_MyAwards",@"Work_Announcement",@"Work_QrCode",@"Work_ClerkManagement"];
    
    NSInteger integer = 0;
    NSInteger countInteger = 0;
    
    for (int i = 0; i < self.titileArray.count; i++) {
        
        if (countInteger == 3) {
            integer++;
        }
        
        countInteger = i%4;
        
        UIView *view = [UIView new];
        view.tag = i + 1000;
        view.userInteractionEnabled = YES;
        UITapGestureRecognizer *selectTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(selecTap:)];
        [view addGestureRecognizer:selectTap];
        [self.choiceView addSubview:view];
        
        view.sd_layout
        .leftSpaceToView(self.choiceView, 20 + countInteger * (ScreenWidth * 0.23))
        .topSpaceToView(self.choiceView, 5 + integer * (ScreenWidth * 0.22))
        .widthIs(ScreenWidth * 0.21)
        .heightIs(ScreenWidth * 0.21);
        
        UIImageView *imageView = [UIImageView new];
        imageView.image = [UIImage imageNamed:imageArray[i]];
        imageView.contentMode = UIViewContentModeScaleAspectFit;
        [view addSubview:imageView];
        
        imageView.sd_layout
        .centerXEqualToView(view)
        .topSpaceToView(view, 5)
        .widthIs(40)
        .heightEqualToWidth();
        
        UILabel *titleLabel = [UILabel new];
        titleLabel.text = self.titileArray[i];
        titleLabel.font = [UIFont systemFontOfSize:14];
        [view addSubview:titleLabel];
        
        titleLabel.sd_layout
        .centerXEqualToView(view)
        .topSpaceToView(imageView, 5)
        .heightIs(14);
        [titleLabel setSingleLineAutoResizeWithMaxWidth:100];
        
    }
    
}

-(void)selecTap:(UITapGestureRecognizer *)sender{
    
    NSString *string = self.titileArray[sender.view.tag - 1000];
    NSLog(@"点击了 - %@",string);
    
    if ([string isEqualToString:@"公告信息"]) {
        
        AnnouncementViewController *announcementView = [[AnnouncementViewController alloc] init];
        announcementView.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:announcementView animated:YES];
        
    }
    
    if ([string isEqualToString:@"扫码提货"]) {
        
        
        
    }
    
    
}

@end
