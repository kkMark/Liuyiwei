//
//  ResultsSettingView.m
//  Lywsale
//
//  Created by M on 2018/9/25.
//  Copyright © 2018年 黄锡凯. All rights reserved.
//

#import "ResultsSettingView.h"

@implementation ResultsSettingView

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSources.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if (cell == nil) {
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"Cell"];
    }
    
    cell.textLabel.font = [UIFont systemFontOfSize:14];
    return cell;
}

@end
