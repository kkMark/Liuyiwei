//
//  TrainingView.m
//  Lywsale
//
//  Created by 黄锡凯 on 2018/10/29.
//  Copyright © 2018 黄锡凯. All rights reserved.
//

#import "TrainingView.h"
#import "PublicHeaderView.h"
#import "TrainingSelectionView.h"

@interface TrainingView() <UIScrollViewDelegate>

@property (nonatomic, strong) UIView *vedioBgView;
@property (nonatomic, strong) UIView *vedioView;
@property (nonatomic, strong) UILabel *vedioName;
@property (nonatomic, strong) UILabel *vedioRemark;
@property (nonatomic, strong) UIScrollView *bgScrollView;
@property (nonatomic, strong) PublicHeaderView *headerView;
@property (nonatomic, strong) TrainingSelectionView *selectionView;

@end

@implementation TrainingView
@synthesize headerView;
@synthesize bgScrollView;
@synthesize vedioBgView;
@synthesize selectionView;

- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        
        [self setupSubviews];
    }
    
    return self;
}

- (void)setupSubviews {
    
    self.backgroundColor = kPageBgColor;
    vedioBgView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 0)];
    vedioBgView.backgroundColor = [UIColor whiteColor];
    [self addSubview:vedioBgView];
    
    self.vedioView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenWidth * 0.65)];
    self.vedioView.backgroundColor = [UIColor blackColor];
    [vedioBgView addSubview:self.vedioView];
    
    UIButton *collectionBtn = [self collectionBtnWithFrame:CGRectMake(0, self.vedioView.maxY + 10, 0, 35)];
    collectionBtn.x = vedioBgView.width - collectionBtn.width - 15;
    [vedioBgView addSubview:collectionBtn];
    
    self.vedioName = [[UILabel alloc] initWithFrame:CGRectMake(15, 0, 0, 20)];
    self.vedioName.centerY = collectionBtn.centerY;
    self.vedioName.width = vedioBgView.width - collectionBtn.width - 30;
    self.vedioName.text = @"博路定用药培训";
    self.vedioName.font = [UIFont systemFontOfSize:16];
    self.vedioName.textColor = kMainTextColor;
    [vedioBgView addSubview:self.vedioName];
    
    UILabel *remarkTitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, collectionBtn.maxY + 10, vedioBgView.width, 15)];
    remarkTitleLabel.text = @"课程简介";
    remarkTitleLabel.font = [UIFont systemFontOfSize:14];
    remarkTitleLabel.textColor = kMainTextColor;
    [vedioBgView addSubview:remarkTitleLabel];
    
    self.vedioRemark = [[UILabel alloc] initWithFrame:CGRectMake(15, remarkTitleLabel.maxY + 3, vedioBgView.width - 30, 60)];
    self.vedioRemark.text = @"心理学家唐纳德·达顿和亚瑟·阿伦设计了一场经典的实验：吸引力测试，他们把男士分为两组放到不同的桥上，一座桥不但高而且";
    self.vedioRemark.font = [UIFont systemFontOfSize:12];
    self.vedioRemark.textColor = [UIColor colorWithHexString:@"0x666666"];
    self.vedioRemark.numberOfLines = 0;
    self.vedioRemark.height = [self.vedioRemark getTextWidth];
    self.vedioRemark.height = self.vedioRemark.height > 60 ? 60 : self.vedioRemark.height;
    [vedioBgView addSubview:self.vedioRemark];
    
    UIButton *lookBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    lookBtn.frame = CGRectMake(0, self.vedioRemark.maxY, vedioBgView.width, 40);
    lookBtn.titleLabel.font = [UIFont systemFontOfSize:12];
    [lookBtn setImage:[UIImage imageNamed:@"training_more"] forState:UIControlStateNormal];
    [lookBtn setTitle:@"查看全文" forState:UIControlStateNormal];
    [lookBtn setTitleColor:[UIColor colorWithHexString:@"0x666666"] forState:UIControlStateNormal];
    [vedioBgView addSubview:lookBtn];
    
    self.vedioBgView.height = lookBtn.maxY;
    self.bgScrollView.backgroundColor = kPageBgColor;
}
    
- (UIButton *)collectionBtnWithFrame:(CGRect)rect {
    
    UIButton *collectionBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    collectionBtn.frame = rect;
    
    UIImageView *collectionImgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 24, 24)];
    collectionImgView.image = [UIImage imageNamed:@"training_collection"];
    collectionImgView.centerY = collectionImgView.height / 2;
    [collectionBtn addSubview:collectionImgView];
    
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(collectionImgView.maxX + 5, 0, 0, 20)];
    titleLabel.text = @"收藏";
    titleLabel.font = [UIFont systemFontOfSize:14];
    titleLabel.textColor = kMainTextColor;
    titleLabel.centerY = collectionImgView.centerY;
    titleLabel.width = [titleLabel getTextWidth];
    collectionBtn.width = titleLabel.maxX;
    [collectionBtn addSubview:titleLabel];
    
    return collectionBtn;
}


#pragma mark - lazy
- (PublicHeaderView *)headerView {
    
    if (!headerView) {
        
        headerView = [[PublicHeaderView alloc] initWithFrame:CGRectMake(0, vedioBgView.maxY + 10, ScreenWidth, 45)];
        headerView.titles = @[@"选集", @"评论"];
        [self addSubview:headerView];
        
        @weakify(self);
        [headerView setSelectIndexBlock:^(NSInteger index) {
            
            @strongify(self);
            [self.bgScrollView setContentOffset:CGPointMake(ScreenWidth * index, 0) animated:YES];
        }];
    }
    
    return headerView;
}

- (TrainingSelectionView *)selectionView {
    
    if (!selectionView) {
        
        selectionView = [[TrainingSelectionView alloc] initWithFrame:self.bgScrollView.frame style:UITableViewStyleGrouped];
        selectionView.y = 0;
        [self.bgScrollView addSubview:selectionView];
    }
    
    return selectionView;
}

- (UIScrollView *)bgScrollView {
    
    if (!bgScrollView) {
        
        bgScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, self.height)];
        bgScrollView.pagingEnabled = YES;
        bgScrollView.delegate = self;
        bgScrollView.y = self.headerView.maxY;
        bgScrollView.height -= self.headerView.maxY;
        bgScrollView.contentSize = CGSizeMake(ScreenWidth * 2, 0);
        bgScrollView.showsVerticalScrollIndicator = NO;
        bgScrollView.showsHorizontalScrollIndicator = NO;
        [self addSubview:bgScrollView];
        
        self.selectionView.dataSources = @[@"", @"", @""];
    }
    
    return bgScrollView;
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    
    NSInteger index = scrollView.contentOffset.x / scrollView.width;
    self.headerView.index = index;
}


@end
