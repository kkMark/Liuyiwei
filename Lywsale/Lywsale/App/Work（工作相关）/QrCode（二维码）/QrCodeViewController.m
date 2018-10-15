//
//  QrCodeViewController.m
//  Lywsale
//
//  Created by 尚洋 on 2018/10/12.
//  Copyright © 2018年 黄锡凯. All rights reserved.
//

#import "QrCodeViewController.h"
#import "QRMembersViewController.h"

@interface QrCodeViewController ()

@end

@implementation QrCodeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self addChildViewController];
    
    [self initNav];
    
    [self initUI];
    
}

-(void)addChildViewController{
    
    QRMembersViewController *VC = [[QRMembersViewController alloc] init];
    VC.type = 0;
    [self addChildViewController:VC];
    
    QRMembersViewController *VC1 = [[QRMembersViewController alloc] init];
    VC1.type = 1;
    [self addChildViewController:VC1];
    
}

-(void)initNav{
    
    NSArray *titleArray = @[@"邀请会员",@"邀请店员"];
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 300, 40)];
    
    UIView *headerLine = [[UIView alloc] initWithFrame:CGRectMake(0, view.height - 3, 100, 2)];
    headerLine.backgroundColor = [UIColor whiteColor];
    headerLine.centerX = ScreenWidth / 3 / 2;
    [view addSubview:headerLine];
    
    for (int i = 0; i < titleArray.count; i++) {
        
        UIButton *titleBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        titleBtn.tag = i + 10;
        titleBtn.selected = i == 0 ? YES : NO;
        titleBtn.frame = CGRectMake(ScreenWidth / 3 * i, 0, ScreenWidth / 3, view.height);
        titleBtn.titleLabel.font = [UIFont systemFontOfSize:14];
        [titleBtn setTitle:titleArray[i] forState:UIControlStateNormal];
        [titleBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [titleBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
        [view addSubview:titleBtn];
        
        [[titleBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
            
            [UIView animateWithDuration:0.25 animations:^{
                
                for (int index = 0; index < titleArray.count; index++) {
                    
                    UIButton *tempBtn = [self.view viewWithTag:index + 10];
                    if (index == i) tempBtn.selected = YES;
                    else tempBtn.selected = NO;
                }

                headerLine.centerX = titleBtn.centerX;
                
            }];
            
            UIButton *tempBtn = x;
            
            if (tempBtn.tag - 10 == 0) {
                
                [self transitionFromViewController:self.childViewControllers[0] toViewController:self.childViewControllers[1] duration:0.3 options:UIViewAnimationOptionCurveEaseIn animations:^{
                    
                } completion:^(BOOL finished) {
                    
                    if (finished) {
                        [self.view addSubview:[self.childViewControllers[1] view]];
                    } else {
                        [self.view addSubview:[self.childViewControllers[0] view]];
                    }
                    
                }];
                
            }else{
                
                [self transitionFromViewController:self.childViewControllers[1] toViewController:self.childViewControllers[0] duration:0.3 options:UIViewAnimationOptionCurveEaseIn animations:^{
                    
                } completion:^(BOOL finished) {
                    
                    if (finished) {
                        [self.view addSubview:[self.childViewControllers[0] view]];
                    } else {
                        [self.view addSubview:[self.childViewControllers[1] view]];
                    }
                    
                }];
                
            }
            
            
        
            
        }];
    }
    
    self.navigationItem.titleView = view;
    
}

-(void)initUI{
    
    [self transitionFromViewController:self.childViewControllers[0] toViewController:self.childViewControllers[1] duration:0.3 options:UIViewAnimationOptionCurveEaseIn animations:^{
        
    } completion:^(BOOL finished) {
        
        if (finished) {
            [self.view addSubview:[self.childViewControllers[1] view]];
        } else {
            [self.view addSubview:[self.childViewControllers[0] view]];
        }
        
    }];
    
}

@end
