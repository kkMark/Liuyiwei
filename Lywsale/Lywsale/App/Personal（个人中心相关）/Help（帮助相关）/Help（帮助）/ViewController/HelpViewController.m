//
//  HelpViewController.m
//  Lywsale
//
//  Created by M on 2018/8/23.
//  Copyright © 2018年 黄锡凯. All rights reserved.
//

#import "HelpViewController.h"
#import "FeedbackViewController.h"
#import "HelpView.h"

@interface HelpViewController ()

@property (nonatomic, strong) HelpView *helpView;

@end

@implementation HelpViewController
@synthesize helpView;

- (void)viewDidLoad {

    [super viewDidLoad];

    self.helpView.dataSources = @[@"提现金额什么时候到帐"];
    
    @weakify(self);
    [self addNavRightTitle:@"我要反馈" complete:^{
        
        @strongify(self);
        FeedbackViewController *vc = [FeedbackViewController new];
        [self.navigationController pushViewController:vc animated:YES];
    }];
}


#pragma mark - lazy
- (HelpView *)helpView {
    
    if (!helpView) {
        
        helpView = [[HelpView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight) style:UITableViewStyleGrouped];
        [self.view addSubview:helpView];
    }
    
    return helpView;
}

@end
