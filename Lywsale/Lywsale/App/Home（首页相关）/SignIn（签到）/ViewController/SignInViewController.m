
//
//  SignInViewController.m
//  Lywsale
//
//  Created by M on 2018/9/22.
//  Copyright © 2018年 黄锡凯. All rights reserved.
//

#import "SignInViewController.h"
#import "SignInView.h"

@interface SignInViewController ()

@property (nonatomic, strong) SignInView *signInView;

@end

@implementation SignInViewController

- (void)viewDidLoad {

    [super viewDidLoad];
    [self setTitle:@"签到拿积分"];
    [self addNavRight];
    
    self.signInView = [[SignInView alloc] initWithFrame:self.view.frame];
    [self.view addSubview:self.signInView];
}

- (void)addNavRight {
    
    @weakify(self);
    [self addNavRightTitle:@"签到规则" complete:^{
        
        @strongify(self);
        
    }];
}

@end
