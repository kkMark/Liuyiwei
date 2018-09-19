//
//  ActivityDetailsViewController.m
//  Lywsale
//
//  Created by M on 2018/9/19.
//  Copyright © 2018年 黄锡凯. All rights reserved.
//

#import "ActivityDetailsViewController.h"
#import "ActivityDetailsView.h"

@interface ActivityDetailsViewController ()

@end

@implementation ActivityDetailsViewController

- (void)viewDidLoad {

    [super viewDidLoad];
    
    ActivityDetailsView *detailsView = [[ActivityDetailsView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight - self.navHeight)];
    [self.view addSubview:detailsView];
}

@end
