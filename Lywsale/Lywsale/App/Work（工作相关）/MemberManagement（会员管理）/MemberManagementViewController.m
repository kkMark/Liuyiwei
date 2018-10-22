//
//  MemberManagementViewController.m
//  Lywsale
//
//  Created by 尚洋 on 2018/10/9.
//  Copyright © 2018年 黄锡凯. All rights reserved.
//

#import "MemberManagementViewController.h"
#import "MemberManagementView.h"
#import "AddMembersViewController.h"

@interface MemberManagementViewController ()

@property (nonatomic ,strong) MemberManagementView *memberManagementView;

@property (nonatomic ,retain) NSMutableArray *dataArray;

@end

@implementation MemberManagementViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"会员管理";
    
    self.dataArray = [NSMutableArray array];
    
    [self.dataArray addObjectsFromArray:@[@{@"肿瘤科":@[
                                                    @{@"image":@"",@"title":@"博路定用药培训"},
                                                    @{@"image":@"",@"title":@"博路定用药培训"},
                                                    @{@"image":@"",@"title":@"博路定用药培训"},
                                                    @{@"image":@"",@"title":@"博路定用药培训"}
                                                    ]},
                                          @{@"肝病科":@[
                                                    @{@"image":@"",@"title":@"博路定用药培训"},
                                                    @{@"image":@"",@"title":@"博路定用药培训"},
                                                    @{@"image":@"",@"title":@"博路定用药培训"},
                                                    @{@"image":@"",@"title":@"博路定用药培训"}
                                                    ]}]];
    
    [self initUI];
    
    [self block];
    
}

-(void)initUI{
    
    self.memberManagementView = [MemberManagementView new];
    [self.view addSubview:self.memberManagementView];
    
    self.memberManagementView.sd_layout
    .leftSpaceToView(self.view, 0)
    .rightSpaceToView(self.view, 0)
    .topSpaceToView(self.view, 0)
    .bottomSpaceToView(self.view, 0);
    
    [self.memberManagementView addTitleList:self.dataArray];
    
}

-(void)block{
    @weakify(self);
    self.memberManagementView.pushBlock = ^(NSString *pushString) {
        @strongify(self);
        
        if ([pushString isEqualToString:@"标签管理"]) {
            
        }
        
        if ([pushString isEqualToString:@"添加会员"]) {
            
            AddMembersViewController *VC = [[AddMembersViewController alloc] init];
            [self.navigationController pushViewController:VC animated:YES];
            
        }
        
        if ([pushString isEqualToString:@"群发消息"]) {
            
        }
        
    };
    
}


@end
