//
//  ExamDetailsViewController.m
//  Lywsale
//
//  Created by 黄锡凯 on 2018/11/7.
//  Copyright © 2018 黄锡凯. All rights reserved.
//

#import "ExamDetailsViewController.h"
#import "ExamContentView.h"

@interface ExamDetailsViewController ()

@property (nonatomic, strong) ExamContentView *contentView;

@end

@implementation ExamDetailsViewController
@synthesize contentView;

- (void)viewDidLoad {

    [super viewDidLoad];

    [self setTitle:@"答题详情"];

}

- (ExamContentView *)contentView {
    
    if (!contentView) {
        
        contentView = [[ExamContentView alloc] initWithFrame:self.view.frame];
        contentView.height = ScreenHeight - self.navHeight;
        contentView.backgroundColor = kPageBgColor;
        [self.contentView addSubview:contentView];
    }
    
    return contentView;
}

@end
