//
//  ExamContentViewController.m
//  Lywsale
//
//  Created by 黄锡凯 on 2018/11/7.
//  Copyright © 2018 黄锡凯. All rights reserved.
//

#import "ExamContentViewController.h"
#import "ExamContentView.h"
#import "ExamContentModel.h"

@interface ExamContentViewController ()

@property (nonatomic, strong) ExamContentView *contentView;
@property (nonatomic, assign) int index;

@end

@implementation ExamContentViewController

- (void)viewDidLoad {

    [super viewDidLoad];
    
    self.index = 0;
    [self setTitle:@"考试内容"];
    [self initNavRight];
    [self initExamContentView];
    [self initBottomBtn];
}

- (void)initNavRight {
    
    [self addNavRightTitle:@"交卷" complete:^{
        
    }];
}

- (void)initExamContentView {
    
    ExamContentModel *model = self.contents[0];
    
    self.contentView = [[ExamContentView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight - self.navHeight - 45)];
    self.contentView.backgroundColor = kPageBgColor;
    [self.contentView setTitle:model.question content:model.options];
    [self.view addSubview:self.contentView];
}

- (void)initBottomBtn {
    
    for (int i = 0; i < 2; i++) {
        
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(ScreenWidth / 2 * i, self.contentView.maxY, ScreenWidth / 2, 45);
        button.backgroundColor = [UIColor colorWithHexString:i == 0 ? @"0xC8CEE9" : @"0x5167F1"];
        button.titleLabel.font = [UIFont systemFontOfSize:16];
        [button setTitle:i == 0 ? @"上一题" : @"下一题" forState:UIControlStateNormal];
        [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [self.view addSubview:button];
        
        [[button rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
           
            if (i == 0) {
                
                if (self.index == 0) {
                    
                    [self.view makeToast:@"目前是第一题"];
                    return ;
                }
                
                self.index -= 1;
                ExamContentModel *model = self.contents[self.index];
                [self.contentView setTitle:model.question content:model.options];

            }
            else {
                
                if (self.index == self.contents.count - 1) {
                    
                    [self.view makeToast:@"已是最后一题"];
                    return ;
                }
                
                self.index += 1;
                ExamContentModel *model = self.contents[self.index];
                [self.contentView setTitle:model.question content:model.options];
            }
        }];
    }
}

@end
