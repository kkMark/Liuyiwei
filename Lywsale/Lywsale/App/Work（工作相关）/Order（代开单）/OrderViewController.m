//
//  OrderViewController.m
//  Lywsale
//
//  Created by 尚洋 on 2018/10/12.
//  Copyright © 2018年 黄锡凯. All rights reserved.
//

#import "OrderViewController.h"

@interface OrderViewController ()

@end

@implementation OrderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"代开单";
    
    [self initUI];
    
}

-(void)initUI{
    
    UIImageView *imageView = [UIImageView new];
    imageView.image = [UIImage imageNamed:@"Work_AddOrder"];
    [self.view addSubview:imageView];
    
    imageView.sd_layout
    .centerXEqualToView(self.view)
    .topSpaceToView(self.view, 110)
    .widthIs(100)
    .heightEqualToWidth();
    
    UILabel *label = [UILabel new];
    label.text = @"点击添加商品";
    label.font = [UIFont systemFontOfSize:14];
    [self.view addSubview:label];
    
    label.sd_layout
    .centerXEqualToView(self.view)
    .topSpaceToView(imageView, 15)
    .heightIs(14);
    [label setSingleLineAutoResizeWithMaxWidth:100];
    
}

@end
