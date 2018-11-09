//
//  ExamHomeViewController.m
//  Lywsale
//
//  Created by 黄锡凯 on 2018/11/7.
//  Copyright © 2018 黄锡凯. All rights reserved.
//

#import "ExamHomeViewController.h"
#import "ExamHomeViewModel.h"
#import "ExamHomeView.h"
#import "ExamContentViewController.h"
#import "ExamContentModel.h"

@interface ExamHomeViewController ()

@property (nonatomic, strong) ExamHomeView *examHomeView;
@property (nonatomic, strong) UIButton *bottomBtn;
@property (nonatomic, copy) NSArray *contents;

@end

@implementation ExamHomeViewController
@synthesize examHomeView;
@synthesize bottomBtn;

- (void)viewDidLoad {

    [super viewDidLoad];

    [self setTitle:@"考试简介"];
    [self.examHomeView setModel:self.model];
    [self getExamInfo];
}

- (ExamHomeView *)examHomeView {
    
    if (!examHomeView) {
        
        examHomeView = [[ExamHomeView alloc] initWithFrame:self.view.frame style:UITableViewStyleGrouped];
        examHomeView.height = ScreenHeight - self.navHeight - self.bottomBtn.height;
        examHomeView.dataSources = @[@"试卷名称", @"试卷题数", @"考试时间", @"合格标准", @"限制次数"];
        [self.view addSubview:examHomeView];
    }
    
    return examHomeView;
}

- (UIButton *)bottomBtn {
    
    if (!bottomBtn) {
        
        bottomBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        bottomBtn.backgroundColor = kMainColor;
        bottomBtn.frame = CGRectMake(0, ScreenHeight - self.navHeight - 45, ScreenWidth, 45);
        bottomBtn.titleLabel.font = [UIFont systemFontOfSize:16];
        [bottomBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [bottomBtn setTitle:@"开始答题" forState:UIControlStateNormal];
        [self.view addSubview:bottomBtn];
        
        @weakify(self);
        [[bottomBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
         
            @strongify(self);
            ExamContentViewController *vc = [ExamContentViewController new];
            vc.contents = self.contents;
            vc.trainId = self.trainId;
            [self.navigationController pushViewController:vc animated:YES];
        }];
    }
    
    return bottomBtn;
}


#pragma mark - request
- (void)getExamInfo {
    
    [[ExamHomeViewModel new] getExamInfoWithIdString:self.model.examPaperId success:^(NSDictionary *dict) {
       
        NSMutableArray *arr = [NSMutableArray array];
        for (NSDictionary *questionDict in dict[@"questions"]) {
            
            ExamContentModel *model = [ExamContentModel new];
            [model setValuesForKeysWithDictionary:questionDict];
            
            model.examPaperId = dict[@"id"];
            [arr addObject:model];
        }
        
        self.contents = arr;
        
    } failure:^(NSError *error) {
        
        
    }];
}

@end
