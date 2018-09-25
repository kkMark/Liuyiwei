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
    
    [self request];
    
    [self initUI];
    
    [self block];
    
    [self refresh];
    
}

-(void)initUI{
    
    self.announcementView = [AnnouncementView new];
    [self.view addSubview:self.announcementView];
    
    self.announcementView.sd_layout
    .leftSpaceToView(self.view, 0)
    .rightSpaceToView(self.view, 0)
    .topSpaceToView(self.view, 0)
    .bottomSpaceToView(self.view, 0);
    
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
