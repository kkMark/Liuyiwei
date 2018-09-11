//
//  MaintenanceViewController.m
//  Lywsale
//
//  Created by M on 2018/9/11.
//  Copyright © 2018年 黄锡凯. All rights reserved.
//

#import "MaintenanceViewController.h"
#import "MaintenanceView.h"

@interface MaintenanceViewController ()

@property (nonatomic, strong) MaintenanceView *maintenanceView;

@end

@implementation MaintenanceViewController
@synthesize maintenanceView;

- (void)viewDidLoad {
    
    [super viewDidLoad];

    
}

- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    
    self.maintenanceView.dataSources = @[@"", @"", @"", @"", @"", @""];
}

- (MaintenanceView *)maintenanceView {
    
    if (!maintenanceView) {
        
        maintenanceView = [[MaintenanceView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, self.view.height + 45) style:UITableViewStyleGrouped];
        [self.view addSubview:maintenanceView];
    }
    
    return maintenanceView;
}

@end
