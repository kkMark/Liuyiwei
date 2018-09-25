
//
//  SignInViewController.m
//  Lywsale
//
//  Created by M on 2018/9/22.
//  Copyright © 2018年 黄锡凯. All rights reserved.
//

#import "SignInViewController.h"
#import "SignInView.h"
#import "SignInRulesView.h"

@interface SignInViewController ()

@property (nonatomic, strong) SignInView *signInView;

@end

@implementation SignInViewController

- (void)viewDidLoad {

    [super viewDidLoad];
    [self setTitle:@"签到拿积分"];
    [self addNavRight];
    
    self.signInView = [[SignInView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight - self.navHeight)];
    [self.view addSubview:self.signInView];
}

- (void)addNavRight {
    
    [self addNavRightTitle:@"签到规则" complete:^{
        
        SignInRulesView *rulesView = [[SignInRulesView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight)];
        [[UIApplication sharedApplication].keyWindow addSubview:rulesView];
    }];
}

@end
