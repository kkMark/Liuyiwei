//
//  FeedbackView.m
//  Lywsale
//
//  Created by M on 2018/8/23.
//  Copyright © 2018年 黄锡凯. All rights reserved.
//

#import "FeedbackView.h"
#import "KTextFeildView.h"
#import "SelectPriceView.h"

@interface FeedbackView ()

@property (nonatomic, copy) NSString *typeString;
@property (nonatomic, strong) UIView *footerView;
@property (nonatomic, strong) SelectPriceView *selectPriceView;

@end

@implementation FeedbackView
@synthesize footerView;
@synthesize selectPriceView;

- (SelectPriceView *)selectPriceView {
    
    if (!selectPriceView) {
        
        selectPriceView = [[SelectPriceView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight)];
        self.selectPriceView.priceArr = @[@"系统", @"知识", @"工作"];
        [self addSubview:selectPriceView];

        @weakify(self);
        [selectPriceView setDidTextStringBlock:^(NSString *textString) {

            @strongify(self);
            UITableViewCell *cell = [self cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
            cell.detailTextLabel.text = textString;
        }];
    }
    
    return selectPriceView;
}


#pragma mark - lazy
- (UIView *)footerView {
    
    if (!footerView) {
        
        footerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 200)];
        footerView.backgroundColor = [UIColor whiteColor];
        
        KTextFeildView *textFeildView = [[KTextFeildView alloc] initWithFrame:CGRectMake(20, 15, ScreenWidth - 40, 170)];
        textFeildView.tipString = @"碰到问题，请告诉我们";
        textFeildView.layer.borderColor = [kLineColor CGColor];
        textFeildView.layer.borderWidth = 0.3;
        [footerView addSubview:textFeildView];
        
        UIButton *nextBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        nextBtn.backgroundColor = kMainColor;
        nextBtn.frame = CGRectMake(35, textFeildView.maxY + 15, ScreenWidth - 70, 35);
        nextBtn.layer.cornerRadius = nextBtn.height / 2;
        nextBtn.layer.masksToBounds = YES;
        nextBtn.titleLabel.font = [UIFont systemFontOfSize:14];
        [nextBtn setTitle:@"发送" forState:UIControlStateNormal];
        [nextBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [footerView addSubview:nextBtn];
        footerView.height = nextBtn.maxY + 15;
        
        UIView *lineView = [[UILabel alloc] initWithFrame:CGRectMake(0, footerView.maxY, ScreenWidth, 0.3)];
        lineView.backgroundColor = kLineColor;
        [footerView addSubview:lineView];
    }
    
    return footerView;
}


#pragma mark - tableView
- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style {
    
    if (self = [super initWithFrame:frame style:style]) {
        
        self.scrollEnabled = NO;
        self.tableFooterView = self.footerView;
    }
    
    return self;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if (cell == nil) {
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"Cell"];
        
        UIImageView *moreImgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 17, 17)];
        moreImgView.image = [UIImage imageNamed:@"more"];
        cell.accessoryView = moreImgView;
    }
    
    cell.textLabel.font = [UIFont systemFontOfSize:14];
    cell.textLabel.text = self.dataSources[indexPath.row];
    cell.textLabel.textColor = kMainTextColor;
    cell.detailTextLabel.textColor = kMainTextColor;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [super tableView:tableView didSelectRowAtIndexPath:indexPath];
    
    self.selectPriceView.hidden = NO;
    self.selectPriceView.isShowList = YES;
}

@end
