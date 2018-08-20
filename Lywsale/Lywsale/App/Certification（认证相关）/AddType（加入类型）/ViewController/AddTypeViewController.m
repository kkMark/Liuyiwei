//
//  AddTypeViewController.m
//  Lywsale
//
//  Created by M on 2018/8/19.
//  Copyright © 2018年 黄锡凯. All rights reserved.
//

#import "AddTypeViewController.h"
#import "AddTypeView.h"

@interface AddTypeViewController ()

@property (nonatomic, strong) AddTypeView *addTypeView;
@property (nonatomic, strong) UIView *userTypeView;

@end

@implementation AddTypeViewController
@synthesize addTypeView;
@synthesize userTypeView;

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    // 默认药店
    self.title = @"加入药店";
    self.addTypeView.type = PharmacyType;
}


#pragma mark - lazy
- (AddTypeView *)addTypeView {
    
    if (!addTypeView) {
        
        addTypeView = [[AddTypeView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight - self.navHeight - self.userTypeView.height) style:UITableViewStyleGrouped];
        addTypeView.backgroundColor = [UIColor whiteColor];
        [self.view addSubview:addTypeView];
        
        @weakify(self);
        [self.addTypeView setGoViewController:^(UIViewController *vc) {
           
            @strongify(self);
            vc.title = [self.title stringByReplacingOccurrencesOfString:@"加入" withString:@"选择"];
            [self.navigationController pushViewController:vc animated:YES];
        }];
    }
    
    return addTypeView;
}

- (UIView *)userTypeView {
    
    if (!userTypeView) {
        
        userTypeView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 0)];
        userTypeView.backgroundColor = [UIColor whiteColor];
        [self.view addSubview:userTypeView];
        
        NSArray *titles = @[@"我是连锁人员", @"我是药企人员"];
        for (int i = 0; i < 2; i++) {
            
            UIButton *userTypeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
            userTypeBtn.frame = CGRectMake(ScreenWidth / 2 * i, 0, ScreenWidth / 2, 0);
            [userTypeView addSubview:userTypeBtn];
            
            UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 15, userTypeBtn.width, 0)];
            titleLabel.tag = i + 100;
            titleLabel.text = titles[i];
            titleLabel.font = [UIFont boldSystemFontOfSize:16];
            titleLabel.textColor = kMainTextColor;
            titleLabel.textAlignment = NSTextAlignmentCenter;
            titleLabel.height = [titleLabel getTextHeight];
            [userTypeBtn addSubview:titleLabel];
            
            UILabel *remarkLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(titleLabel.frame) + 10, userTypeBtn.width, 0)];
            remarkLabel.text = @"点击申请认证开通";
            remarkLabel.font = [UIFont systemFontOfSize:13];
            remarkLabel.textColor = kMainTextColor;
            remarkLabel.textAlignment = NSTextAlignmentCenter;
            remarkLabel.height = [remarkLabel getTextHeight];
            [userTypeBtn addSubview:remarkLabel];
            
            @weakify(self);
            [[userTypeBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
             
                @strongify(self);
                
                RegisteredUserType userType = PharmacyType;
                NSString *navTitle = @"加入药店";
                NSArray *tempTitles = @[@"我是连锁人员", @"我是药企人员"];
                UILabel *titleLabel = [self.view viewWithTag:i + 100];
                if ([titleLabel.text isEqualToString:@"我是连锁人员"]) {
                    userType = ChainType;
                    navTitle = @"加入连锁";
                    tempTitles = @[@"我是药店人员", @"我是药企人员"];
                }
                else if ([titleLabel.text isEqualToString:@"我是药企人员"]) {
                    userType = PharmaceuticalType;
                    navTitle = @"加入药企";
                    tempTitles = @[@"我是药店人员", @"我是连锁人员"];
                }

                for (int index = 0; index < 2; index++) {
                    
                    UILabel *titleLabel = [self.view viewWithTag:index + 100];
                    titleLabel.text = tempTitles[index];
                }
                
                self.title = navTitle;
                self.addTypeView.type = userType;
            }];
            
            // 修改Frame
            userTypeBtn.height = CGRectGetMaxY(remarkLabel.frame) + 15;
            userTypeView.height = userTypeBtn.height + self.navBarHeight;
            userTypeView.y = ScreenHeight - self.navHeight - userTypeView.height;
            
            userTypeBtn.centerY = userTypeView.height  / 2;
        }
        
        UIView *lineView = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 0.5)];
        lineView.backgroundColor = kLineColor;
        [userTypeView addSubview:lineView];
        
        UIView *cenLineView = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 0.5, userTypeView.height)];
        cenLineView.centerX = userTypeView.centerX;
        cenLineView.backgroundColor = kLineColor;
        [userTypeView addSubview:cenLineView];
    }
    
    return userTypeView;
}

@end
