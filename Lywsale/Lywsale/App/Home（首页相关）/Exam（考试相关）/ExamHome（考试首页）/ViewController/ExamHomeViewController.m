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

@interface ExamHomeViewController ()

@property (nonatomic, strong) ExamHomeView *examHomeView;

@end

@implementation ExamHomeViewController
@synthesize examHomeView;

- (void)viewDidLoad {

    [super viewDidLoad];

    
}

- (ExamHomeView *)examHomeView {
    
    if (!examHomeView) {
        
        examHomeView = [[ExamHomeView alloc] initWithFrame:self.view.frame style:UITableViewStyleGrouped];
        examHomeView.height = ScreenHeight - self.navHeight;
        examHomeView.dataSources = @[@"试卷名称", @"试卷题数", @"考试时间", @"合格标准", @"限制次数"];
        [self.view addSubview:examHomeView];
    }
    
    return examHomeView;
}


#pragma mark - request
- (void)getExamInfo {
    
    [[ExamHomeViewModel new] getExamInfoWithIdString:self.idString success:^(NSDictionary *dict) {
       
        
        
    } failure:^(NSError *error) {
        
        
    }];
}

@end
