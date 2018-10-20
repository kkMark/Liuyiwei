//
//  AddCardViewController.m
//  Lywsale
//
//  Created by 黄锡凯 on 2018/10/20.
//  Copyright © 2018 黄锡凯. All rights reserved.
//

#import "AddCardViewController.h"
#import "AddCardView.h"

@interface AddCardViewController ()

@property (nonatomic, strong) AddCardView *addCardView;

@end

@implementation AddCardViewController
@synthesize addCardView;

- (void)viewDidLoad {

    [super viewDidLoad];

    self.title = @"添加银行卡";
    self.addCardView.dataSources = @[@"持卡人", @"银行", @"支行", @"卡号"];
}

#pragma mark - lazy
- (AddCardView *)addCardView {
    
    if (!addCardView) {
        
        addCardView = [[AddCardView alloc] initWithFrame:self.view.frame style:UITableViewStyleGrouped];
        addCardView.height = ScreenHeight - self.navHeight;
        [self.view addSubview:addCardView];
    }
    
    return addCardView;
}

@end

