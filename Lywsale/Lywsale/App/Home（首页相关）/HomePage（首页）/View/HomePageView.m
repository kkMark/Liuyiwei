//
//  HomePageView.m
//  Lywsale
//
//  Created by M on 2018/8/28.
//  Copyright © 2018年 黄锡凯. All rights reserved.
//

#import "HomePageView.h"
#import "DataPanelView.h"
#import "TaskPanelView.h"

@interface HomePageView ()

@property (nonatomic, strong) DataPanelView *dataPanelView;
@property (nonatomic, strong) TaskPanelView *taskPanelView;

@end

@implementation HomePageView
@synthesize dataPanelView;
@synthesize taskPanelView;

- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        
        self.index = 0;
        self.delegate = self;
        self.bounces = NO;
        self.pagingEnabled = YES;
        self.showsHorizontalScrollIndicator = NO;
        self.contentSize = CGSizeMake(ScreenWidth * 2, 0);
        
        [self setupSubviews];
    }
    
    return self;
}

- (void)setupSubviews {
    
    self.dataPanelView.dataSources = @[@"", @"", @"", @""];
    self.taskPanelView.backgroundColor = kPageBgColor;
}

#pragma mark - set
- (void)setIndex:(NSInteger)index {
    
    _index = index;
    [self setContentOffset:CGPointMake(ScreenWidth * index, 0) animated:YES];
}


#pragma mark - lazy
- (DataPanelView *)dataPanelView {
    
    if (!dataPanelView) {
        
        dataPanelView = [[DataPanelView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, self.height) style:UITableViewStyleGrouped];
        [self addSubview:dataPanelView];
    }
    
    return dataPanelView;
}

- (TaskPanelView *)taskPanelView {
    
    if (!taskPanelView) {
        
        taskPanelView = [[TaskPanelView alloc] initWithFrame:CGRectMake(ScreenWidth, 0, ScreenWidth, self.height)];
        [self addSubview:taskPanelView];
    }
    
    return taskPanelView;
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    
    NSInteger tempIndex = scrollView.contentOffset.x / ScreenWidth;
    NSLog(@"tempIndex = %zd", tempIndex);
    NSLog(@"index = %zd", self.index);
    
    if ((tempIndex != self.index) && self.moveBlock) {
        self.index = tempIndex;
        self.moveBlock(tempIndex);
    }
}

@end
