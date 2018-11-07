//
//  ExamContentViewController.m
//  Lywsale
//
//  Created by 黄锡凯 on 2018/11/7.
//  Copyright © 2018 黄锡凯. All rights reserved.
//

#import "ExamContentViewController.h"

@interface ExamContentViewController ()

@end

@implementation ExamContentViewController

- (void)viewDidLoad {

    [super viewDidLoad];
    
    [self setTitle:@"考试内容"];
    [self initNavRight];
}

- (void)initNavRight {
    
    [self addNavRightTitle:@"交卷" complete:^{
        
    }];
}

@end
