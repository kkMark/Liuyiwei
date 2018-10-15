//
//  OrderManageListViewController.m
//  Lywsale
//
//  Created by 尚洋 on 2018/10/9.
//  Copyright © 2018年 黄锡凯. All rights reserved.
//

#import "OrderManageListViewController.h"
#import "OrderManageView.h"
#import "OrderManagementRequest.h"

@interface OrderManageListViewController ()

@property (nonatomic ,strong) OrderManageView *orderManageView;

@property (nonatomic ,assign) NSInteger page;

@property (nonatomic ,assign) NSInteger pageSize;

@property (nonatomic ,retain) NSMutableArray *dataArray;

@end

@implementation OrderManageListViewController

- (void)viewWillAppear:(BOOL)animated{
    
    [self.dataArray removeAllObjects];
    
    self.page = 1;
    
    self.pageSize = 30;
    
    [self request];
    
}

-(void)request{
    
    if (self.type == 0) {
        
        [[OrderManagementRequest new] GetOrderMainPageNumber:1 PageSize:10 success:^(NSDictionary *dict) {
            
        } failure:^(NSError *error) {
            
        }];
        
    }
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.dataArray = [NSMutableArray array];
    
    [self.dataArray addObjectsFromArray:@[
                                          
                                        @{@"ordermainId":@"201807161023100001",@"customerInformation":@"罗磊 158****0201",@"time":@"2018-07-16",@"curStatusId":@"0000",@"distribution":@"门店自取",@"amount":@"200"},
                                        @{@"ordermainId":@"201807161023100001",@"customerInformation":@"罗磊 158****0201",@"time":@"2018-07-16",@"curStatusId":@"0001",@"distribution":@"门店自取",@"amount":@"200"},
                                        @{@"ordermainId":@"201807161023100001",@"customerInformation":@"罗磊 158****0201",@"time":@"2018-07-16",@"curStatusId":@"0003",@"distribution":@"门店自取",@"amount":@"200"},
                                          
                                          ]];
    
    [self initUI];
    
    [self block];
    
    [self refresh];
    
}

-(void)initUI{
    
    self.orderManageView = [OrderManageView new];
    self.orderManageView.myTable.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:self.orderManageView];
    
    self.orderManageView.sd_layout
    .leftSpaceToView(self.view, 0)
    .rightSpaceToView(self.view, 0)
    .topSpaceToView(self.view, 0)
    .bottomSpaceToView(self.view, 0);
    
    [self.orderManageView addTitleList:self.dataArray];
    
}

-(void)block{
    
}

-(void)refresh{
    
    WS(weakSelf)
    self.orderManageView.myTable.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        
        weakSelf.page = 1;
        weakSelf.pageSize = 30;
        [weakSelf.dataArray removeAllObjects];
        [weakSelf request];
        
    }];
    
    self.orderManageView.myTable.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        
        [weakSelf.dataArray removeAllObjects];
        
        weakSelf.page++;
        
        [weakSelf request];
        
    }];
    
}


@end
