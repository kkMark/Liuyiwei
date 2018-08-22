//
//  WriteInfoViewController.m
//  Lywsale
//
//  Created by M on 2018/8/19.
//  Copyright © 2018年 黄锡凯. All rights reserved.
//

#import "WriteInfoViewController.h"
#import "WriteInfoView.h"

@interface WriteInfoViewController ()

@property (nonatomic, strong) WriteInfoView *writeInfoView;


@end

@implementation WriteInfoViewController
@synthesize writeInfoView;

- (void)viewDidLoad {

    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];
    self.writeInfoView.dataSources = @[@"姓名", @"我是", @"邀请码", @"工作证"];
}


#pragma mark - lazy
- (WriteInfoView *)writeInfoView {
    
    if (!writeInfoView) {
        
        writeInfoView = [[WriteInfoView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight - self.navHeight - 80) style:UITableViewStyleGrouped];
        writeInfoView.backgroundColor = [UIColor whiteColor];
        [self.view addSubview:writeInfoView];
        
        UIButton *okBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        okBtn.backgroundColor = kMainColor;
        okBtn.frame = CGRectMake(15, self.writeInfoView.maxY + 15, ScreenWidth - 30, 40);
        okBtn.layer.cornerRadius = okBtn.height / 2;
        okBtn.layer.masksToBounds = YES;
        okBtn.titleLabel.font = [UIFont boldSystemFontOfSize:15];
        [okBtn setTitle:@"确认加入" forState:UIControlStateNormal];
        [okBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [self.view addSubview:okBtn];
    }
    
    return writeInfoView;
}

@end
