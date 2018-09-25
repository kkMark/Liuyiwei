//
//  BaseTabelListView.h
//  Lywsale
//
//  Created by 尚洋 on 2018/9/24.
//  Copyright © 2018年 黄锡凯. All rights reserved.
//

#import "BaseView.h"

//跳转页面
typedef void(^PushBlock)(NSString *pushString);

@interface BaseTabelListView : BaseView <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView * myTable;

@property (nonatomic ,retain) NSMutableArray *dataSource;

@property (nonatomic ,copy) PushBlock pushBlock;

-(void)addTitleList:(NSArray *)array;

@end
