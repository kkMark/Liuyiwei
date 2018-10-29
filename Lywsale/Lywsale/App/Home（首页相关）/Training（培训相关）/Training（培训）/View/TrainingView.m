//
//  TrainingView.m
//  Lywsale
//
//  Created by 黄锡凯 on 2018/10/29.
//  Copyright © 2018 黄锡凯. All rights reserved.
//

#import "TrainingView.h"

@interface TrainingView()

@property (nonatomic, strong) UIView *vedioView;
@property (nonatomic, strong) UILabel *vedioName;
@property (nonatomic, strong) UILabel *vedioRemark;
    
@end

@implementation TrainingView

- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        
        [self setupSubviews];
    }
    
    return self;
}

- (void)setupSubviews {
    
    self.vedioView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenWidth * 0.65)];
    self.vedioView.backgroundColor = [UIColor blackColor];
    [self addSubview:self.vedioView];
}
    
@end
