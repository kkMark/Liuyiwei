//
//  MyAwardsView.h
//  Lywsale
//
//  Created by 尚洋 on 2018/10/12.
//  Copyright © 2018年 黄锡凯. All rights reserved.
//

#import "BaseTableSectionView.h"

@interface MyAwardsView : BaseTableSectionView

@property (nonatomic ,strong) UIView *headerView;
///总积分
@property (nonatomic ,strong) UILabel *totalScoreLabel;
///总金额
@property (nonatomic ,strong) UILabel *totalAmountLabel;
///可用金额
@property (nonatomic ,strong) UILabel *amountAvailableLabel;

@end
