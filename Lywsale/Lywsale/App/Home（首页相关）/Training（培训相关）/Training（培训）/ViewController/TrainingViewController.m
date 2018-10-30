//
//  TrainingViewController.m
//  Lywsale
//
//  Created by 黄锡凯 on 2018/10/29.
//  Copyright © 2018 黄锡凯. All rights reserved.
//

#import "TrainingViewController.h"
#import "TrainingView.h"

@interface TrainingViewController ()

@property (nonatomic, strong) UIButton *bottomBtn;
@property (nonatomic, strong) TrainingView *trainingView;

@end

@implementation TrainingViewController
@synthesize bottomBtn;
@synthesize trainingView;

- (void)viewDidLoad {

    [super viewDidLoad];
    
    self.trainingView.backgroundColor = kPageBgColor;
}
    
- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:animated];
}

- (void)viewWillDisappear:(BOOL)animated {
    
    [super viewWillDisappear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:animated];
}

- (TrainingView *)trainingView {
    
    if (!trainingView) {
        
        trainingView = [[TrainingView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight - self.bottomBtn.height)];
        [self.view addSubview:self.trainingView];
    }
    
    return trainingView;
}

- (UIButton *)bottomBtn {
    
    if (!bottomBtn) {
        
        bottomBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        bottomBtn.backgroundColor = kMainColor;
        bottomBtn.frame = CGRectMake(0, ScreenHeight - 45, ScreenWidth, 45);
        bottomBtn.titleLabel.font = [UIFont systemFontOfSize:16];
        [bottomBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [bottomBtn setTitle:@"考  试" forState:UIControlStateNormal];
        [self.view addSubview:bottomBtn];
    }
    
    return bottomBtn;
}

@end
