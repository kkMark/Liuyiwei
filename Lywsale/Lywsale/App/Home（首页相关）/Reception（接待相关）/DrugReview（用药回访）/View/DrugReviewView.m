//
//  DrugReviewView.m
//  Lywsale
//
//  Created by M on 2018/9/22.
//  Copyright © 2018年 黄锡凯. All rights reserved.
//

#import "DrugReviewView.h"
#import "ReceptionRemarkCell.h"

@implementation DrugReviewView

#pragma mark - UI
- (UIView *)reviewView {
    
    UIView *bgView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 130, 45)];
    for (int i = 0; i < 2; i++) {
        
        UIButton *typeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        typeBtn.frame = CGRectMake(i * 70, 0, 60, 45);
        [bgView addSubview:typeBtn];
        
        UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 15, 15)];
        imgView.tag = i + 100;
        imgView.centerY = typeBtn.centerY;
        imgView.image = [UIImage imageNamed:i == 0 ? @"checkbox_sel" : @"checkbox_nor"];
        [typeBtn addSubview:imgView];
        
        UILabel *typeLabel = [[UILabel alloc] initWithFrame:CGRectMake(imgView.maxX + 5, 0, 0, 45)];
        typeLabel.width = typeBtn.width - typeLabel.x;
        typeLabel.text = i == 0 ? @"是" : @"否";
        typeLabel.font = [UIFont systemFontOfSize:14];
        typeLabel.textColor = kMainTextColor;
        [typeBtn addSubview:typeLabel];
        
        [[typeBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
            
            for (int index = 0; index < 2; index++) {
                
                UIImageView *imgView = [self viewWithTag:index + 100];
                imgView.image = [UIImage imageNamed:@"checkbox_nor"];
            }
            
            imgView.image = [UIImage imageNamed:@"checkbox_sel"];
        }];
    }
    
    return bgView;
}


#pragma mark - tableview
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSources.count + 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.row == 0) {
        
        ReceptionRemarkCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ReceptionRemarkCell"];
        if (cell == nil) {
            cell = [[ReceptionRemarkCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"Cell"];
        }
        
        cell.title = @"回访备注";
        return cell;
    }
    else {
        
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
        if (cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"Cell"];
        }
        
        if (indexPath.row == 1) {
            
            cell.accessoryView = [self reviewView];
        }
        else {
            
            cell.detailTextLabel.text = @"2018-09-02";
            cell.detailTextLabel.font = [UIFont systemFontOfSize:14];
            cell.detailTextLabel.textColor = kMainTextColor;
            
            UIImageView *moreImgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 15, 15)];
            moreImgView.image = [UIImage imageNamed:@"drug-more"];
            cell.accessoryView = moreImgView;
        }
        
        cell.backgroundColor = [UIColor whiteColor];
        cell.textLabel.text = self.dataSources[indexPath.row - 1];
        cell.textLabel.font = [UIFont systemFontOfSize:14];
        cell.textLabel.textColor = kMainTextColor;
        return cell;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.row == 0) {
        return 200;
    }
    
    return 45;
}

@end

