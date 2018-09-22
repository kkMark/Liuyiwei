//
//  SalesclerkViewController.m
//  Lywsale
//
//  Created by M on 2018/9/22.
//  Copyright © 2018年 黄锡凯. All rights reserved.
//

#import "SalesclerkViewController.h"
#import "SalesclerkView.h"

@interface SalesclerkViewController ()

@property (nonatomic, strong) SalesclerkView *salesclerkView;

@end

@implementation SalesclerkViewController
@synthesize salesclerkView;

- (void)viewDidLoad {

    [super viewDidLoad];
    [self setTitle:@"店员明细"];
}

@end
