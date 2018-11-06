//
//  SalesTaskView.m
//  Lywsale
//
//  Created by M on 2018/8/28.
//  Copyright © 2018年 黄锡凯. All rights reserved.
//

#import "SalesTaskView.h"
#import "SalesTaskCell.h"

@interface SalesTaskView ()

@property (nonatomic, assign) float cellHeight;

@end

@implementation SalesTaskView

#pragma mark - tableview
- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style {
    
    if (self = [super initWithFrame:frame style:style]) {
        
        self.tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 20)];
        self.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    
    return self;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.dataSources.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    SalesTaskCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SalesTaskCell"];
    if (cell == nil) {
        cell = [[SalesTaskCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"SalesTaskCell"];
        cell.backgroundColor = self.backgroundColor;
    }
    
    cell.model = self.dataSources[indexPath.section];
    self.cellHeight = cell.cellHeight;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return self.cellHeight;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (self.goViewControllerBlock) {
        
        UIViewController *vc = [NSClassFromString(@"ActivityDetailsViewController") new];
        [vc setValue:self.dataSources[indexPath.section] forKey:@"model"];
        self.goViewControllerBlock(vc);
    }
}

@end
