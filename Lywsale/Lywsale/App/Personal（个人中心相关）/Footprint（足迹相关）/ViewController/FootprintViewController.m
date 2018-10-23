//
//  FootprintViewController.m
//  Lywsale
//
//  Created by M on 2018/8/22.
//  Copyright © 2018年 黄锡凯. All rights reserved.
//

#import "FootprintViewController.h"
#import "FootprintView.h"

@interface FootprintViewController ()

@property (nonatomic, strong) FootprintView *footprintView;

@end

@implementation FootprintViewController
@synthesize footprintView;

- (void)viewDidLoad {

    [super viewDidLoad];
    
    self.footprintView.dataSources = @[@"", @"", @"", @"", @"", @""];
}

#pragma mark - lazy
- (FootprintView *)footprintView {
    
    if (!footprintView) {
        
        footprintView = [[FootprintView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight - self.navHeight) style:UITableViewStyleGrouped];
        [self.view addSubview:footprintView];
    }
    
    return footprintView;
}

@end
