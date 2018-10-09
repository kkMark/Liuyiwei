//
//  AnnouncementViewController.m
//  Lywsale
//
//  Created by 尚洋 on 2018/9/19.
//  Copyright © 2018年 黄锡凯. All rights reserved.
//

#import "AnnouncementViewController.h"
#import "AnnouncementView.h"

@interface AnnouncementViewController ()

@property (nonatomic ,strong) AnnouncementView *announcementView;

@property (nonatomic ,assign) NSInteger page;

@property (nonatomic ,assign) NSInteger pageSize;

@property (nonatomic ,retain) NSMutableArray *dataArray;

@end

@implementation AnnouncementViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"系统公告";
    
    self.dataArray = [NSMutableArray array];
    
    [self.dataArray addObjectsFromArray:@[
                                          
                                          @{@"content":@"据共同社报道，这是他在确定获奖后首次接受海外媒体的面对面采访。穆奎格认为，刚果内战为“经济战争”。他控诉称：“全世界的人们和企业只考虑利益。追求利益与性暴力受害者的痛苦有直接关系。”",@"title":@"消息内容",@"time":@"2018-01-12 08:33"},
                                          @{@"content":@"据共同社报道，这是他在确定获奖后首次接受海外媒体的面对面采访。穆奎格认为，刚果内战为“经济战争”。他控诉称：“全世界的人们和企业只考虑利益。追求利益与性暴力受害者的痛苦有直接关系。”",@"title":@"消息内容",@"time":@"2018-01-12 08:33"},
                                          @{@"content":@"据共同社报道，这是他在确定获奖后首次接受海外媒体的面对面采访。穆奎格认为，刚果内战为“经济战争”。他控诉称：“全世界的人们和企业只考虑利益。追求利益与性暴力受害者的痛苦有直接关系。”",@"title":@"消息内容",@"time":@"2018-01-12 08:33"}
                                          
                                          ]];
    
    [self request];
    
    [self initUI];
    
    [self block];
    
    [self refresh];
    
}

-(void)initUI{
    
    self.announcementView = [AnnouncementView new];
    self.announcementView.myTable.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:self.announcementView];
    
    self.announcementView.sd_layout
    .leftSpaceToView(self.view, 0)
    .rightSpaceToView(self.view, 0)
    .topSpaceToView(self.view, 0)
    .bottomSpaceToView(self.view, 0);
    
    [self.announcementView addTitleList:self.dataArray];
    
}

-(void)request{
    
}

-(void)block{
    
}

-(void)refresh{
    
    WS(weakSelf)
    self.announcementView.myTable.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        
        weakSelf.page = 1;
        weakSelf.pageSize = 30;
        [weakSelf.dataArray removeAllObjects];
        [weakSelf request];
        
    }];
    
    self.announcementView.myTable.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        
        [weakSelf.dataArray removeAllObjects];
        
        weakSelf.page++;
        
        [weakSelf request];
        
    }];
    
}


@end
