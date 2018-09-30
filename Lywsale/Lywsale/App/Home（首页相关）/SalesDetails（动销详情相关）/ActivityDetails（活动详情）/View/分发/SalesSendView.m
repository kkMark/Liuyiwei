//
//  SalesSendView.m
//  Lywsale
//
//  Created by M on 2018/9/28.
//  Copyright © 2018年 黄锡凯. All rights reserved.
//

#import "SalesSendView.h"
#import "SalesSendListView.h"

@interface SalesSendView ()

@property (nonatomic, strong) SalesSendListView *listView;

@end

@implementation SalesSendView
@synthesize listView;

- (void)setupSubviews {
    [self sendBtn];
}

- (void)setDataSource:(NSArray *)dataSource {
    
    _dataSource = dataSource;
    self.listView.dataSources = dataSource;
}

#pragma mark - UI
- (void)sendBtn {
    
    UIButton *sendBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    sendBtn.backgroundColor = kMainColor;
    sendBtn.frame = CGRectMake(0, self.listView.maxY, ScreenWidth, 45);
    sendBtn.titleLabel.font = [UIFont systemFontOfSize:16];
    [sendBtn setTitle:@"确  定" forState:UIControlStateNormal];
    [sendBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self addSubview:sendBtn];
    
    [[sendBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x)
    {
        
    }];
}

- (SalesSendListView *)listView {
    
    if (!listView) {
        
        listView = [[SalesSendListView alloc] initWithFrame:CGRectMake(0, 0, self.width, self.height - 45) style:UITableViewStyleGrouped];
        [self addSubview:listView];
    }
    
    return listView;
}

@end
