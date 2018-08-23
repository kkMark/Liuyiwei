//
//  ArchivesViewController.m
//  Lywsale
//
//  Created by M on 2018/8/23.
//  Copyright © 2018年 黄锡凯. All rights reserved.
//

#import "ArchivesViewController.h"
#import "ArchivesView.h"

@interface ArchivesViewController ()

@property (nonatomic, strong) ArchivesView *archivesView;

@end

@implementation ArchivesViewController
@synthesize archivesView;

- (void)viewDidLoad {

    [super viewDidLoad];

    self.archivesView.dataSources = @[@"头像", @"姓名", @"职务", @"所属药房", @"绑定手机", @"修改密码"];
}


#pragma mark - lazy
- (ArchivesView *)archivesView {
    
    if (!archivesView) {
        
        archivesView = [[ArchivesView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight - self.navHeight) style:UITableViewStyleGrouped];
        [self.view addSubview:archivesView];
        
        @weakify(self);
        [archivesView setGoViewController:^(UIViewController *vc) {
           
            @strongify(self);
            [self.navigationController pushViewController:vc animated:YES];
        }];
    }
    
    return archivesView;
}

@end
