//
//  MyCardViewController.m
//  GanLuXiangBan
//
//  Created by M on 2018/5/2.
//  Copyright © 2018年 黄锡凯. All rights reserved.
//

#import "MyCardViewController.h"
#import "MyCardView.h"

@interface MyCardViewController ()

@property (nonatomic, strong) MyCardView *myCardView;
@property (nonatomic, strong) UIButton *deleteBtn;

@end

@implementation MyCardViewController
@synthesize myCardView;
@synthesize deleteBtn;

- (void)viewDidLoad {
    
    [super viewDidLoad];

    self.title = @"我的银行卡";
    self.myCardView.dataSources = @[@"", @"", @""];
    
    [self setEditRightTitle];
}

- (void)setEditRightTitle {
    
    __weak typeof(self)weakSelf = self;
    [self addNavRightTitle:@"编辑" complete:^{
     
        weakSelf.myCardView.isEdit = YES;
        weakSelf.myCardView.height -= weakSelf.deleteBtn.height;
        weakSelf.deleteBtn.y = weakSelf.myCardView.maxY;
        [weakSelf addNavRightTitle:@"完成" complete:^{
            
            weakSelf.myCardView.isEdit = NO;
            weakSelf.myCardView.height += weakSelf.deleteBtn.height;
            weakSelf.deleteBtn.y = weakSelf.myCardView.maxY;
            [weakSelf setEditRightTitle];
        }];
    }];
}

#pragma mark - lazy
- (MyCardView *)myCardView {
    
    if (!myCardView) {
        
        myCardView = [[MyCardView alloc] initWithFrame:self.view.frame style:UITableViewStyleGrouped];
        myCardView.height = ScreenHeight - self.navHeight;
        [self.view addSubview:myCardView];
        
        @weakify(self);
        [self.myCardView setGoViewControllerBlock:^(UIViewController *vc) {
           
            @strongify(self);
            vc.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:vc animated:YES];
        }];
    }
    
    return myCardView;
}

- (UIButton *)deleteBtn {
    
    if (!deleteBtn) {
        
        deleteBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        deleteBtn.frame = CGRectMake(0, self.myCardView.maxY - 40, ScreenWidth, 45);
        deleteBtn.backgroundColor = kMainColor;
        deleteBtn.titleLabel.font = [UIFont systemFontOfSize:16];
        [deleteBtn setTitle:@"删  除" forState:UIControlStateNormal];
        [deleteBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [self.view addSubview:deleteBtn];
    }
    
    return deleteBtn;
}

@end
