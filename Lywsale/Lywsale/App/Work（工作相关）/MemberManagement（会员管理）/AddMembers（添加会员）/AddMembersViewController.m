//
//  AddMembersViewController.m
//  Lywsale
//
//  Created by 尚洋 on 2018/10/22.
//  Copyright © 2018年 黄锡凯. All rights reserved.
//

#import "AddMembersViewController.h"
#import "AddMembersView.h"

@interface AddMembersViewController ()

@property (nonatomic ,retain) NSMutableArray *dataArray;

@property (nonatomic ,strong) AddMembersView *addMembersView;

@property (nonatomic ,strong) UIButton *addButon;

@end

@implementation AddMembersViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"添加会员";
    
    self.dataArray = [NSMutableArray array];
    
    [self.dataArray addObjectsFromArray:@[@{@"会员号":@"1"},@{@"姓名":@"1"},@{@"性别":@"1"},@{@"生日":@"1"},@{@"手机号码":@"1"},@{@"科组":@"1"},@{@"病种":@"1"},@{@"省市":@"1"},@{@"级别":@"1"},@{@"加入日期":@"1"},@{@"所属药师":@"1"}]];
    
    [self initUI];
    
}

-(void)initUI{
    
    self.addMembersView = [AddMembersView new];
    [self.view addSubview:self.addMembersView];
    
    self.addMembersView.sd_layout
    .leftSpaceToView(self.view, 0)
    .rightSpaceToView(self.view, 0)
    .topSpaceToView(self.view, 0)
    .bottomSpaceToView(self.view, 0);
    
    [self.addMembersView addTitleList:self.dataArray];
    
    self.addButon = [UIButton new];
    self.addButon.backgroundColor = RGB(81, 103, 241);
    [self.addButon setTitle:@"确定" forState:UIControlStateNormal];
    [self.addButon setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.addButon addTarget:self action:@selector(add:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.addButon];
    
    self.addButon.sd_layout
    .leftSpaceToView(self.view, 0)
    .rightSpaceToView(self.view, 0)
    .heightIs(48)
    .bottomSpaceToView(self.view, kTabbarSafeBottomMargin);
    
}

-(void)add:(UIButton *)sender{
    
    
    
}

@end
