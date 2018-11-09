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
#import "ExamContentViewModel.h"
#import "ExamResultsViewController.h"

@interface ExamContentViewController ()

@property (nonatomic, strong) ExamContentView *contentView;
@property (nonatomic, assign) int index;
@property (nonatomic, strong) NSMutableArray *sels;
@property (nonatomic, strong) UIButton *nextBtn;

@end

@implementation ExamContentViewController

- (void)viewDidLoad {

    [super viewDidLoad];
    
    self.index = 0;
    self.sels = [NSMutableArray array];
    for (int i = 0; i < self.contents.count; i++) {
        [self.sels addObject:@(0)];
    }
    
    [self setTitle:@"考试内容"];
    [self initNavRight];
    [self initExamContentView];
    [self initBottomBtn];
}

- (void)initNavRight {
    
    @weakify(self);
    [self addNavRightTitle:@"交卷" complete:^{
        
        @strongify(self);
        [self submit];
    }];
}

- (void)initExamContentView {
    
    ExamContentModel *model = self.contents[0];
    
    self.contentView = [[ExamContentView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight - self.navHeight - 45)];
    self.contentView.backgroundColor = kPageBgColor;
    [self.contentView setTitle:model.question content:model.options];
    
    self.contentView.maxCount = (int)self.contents.count;
    self.contentView.currentIndex = 1;
    [self.view addSubview:self.contentView];
    
    @weakify(self);
    [self.contentView setSelIndexBlock:^(int index) {
    
        @strongify(self);
        [self.sels replaceObjectAtIndex:self.index withObject:@(index + 1)];
    }];
}

- (void)initBottomBtn {
    
    for (int i = 0; i < 2; i++) {
        
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.tag = i + 50;
        button.frame = CGRectMake(ScreenWidth / 2 * i, self.contentView.maxY, ScreenWidth / 2, 45);
        button.backgroundColor = [UIColor colorWithHexString:i == 0 ? @"0xC8CEE9" : @"0x5167F1"];
        button.titleLabel.font = [UIFont systemFontOfSize:16];
        [button setTitle:i == 0 ? @"上一题" : @"下一题" forState:UIControlStateNormal];
        [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [self.view addSubview:button];
        
        [[button rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
            
            if ([button.titleLabel.text isEqualToString:@"交卷"]) {
                return [self submit];
            }
            
            if (i == 0) {
                
                if (self.index == 0) {
                    
                    [self.view makeToast:@"目前是第一题"];
                    return ;
                }
                
                self.index -= 1;
                ExamContentModel *model = self.contents[self.index];
                [self.contentView setTitle:model.question content:model.options];
                
                self.contentView.currentIndex = self.index + 1;
                self.contentView.selIndex = [self.sels[self.index] intValue] - 1;
            }
            else {
                
                if ([self.sels[self.index] intValue] == 0) {
                    return [self.view makeToast:@"请选择答案"];
                }
                
                if (self.index == self.contents.count - 1) {
                    return ;
                }
                
                self.index += 1;
                ExamContentModel *model = self.contents[self.index];
                [self.contentView setTitle:model.question content:model.options];
                
                self.contentView.currentIndex = self.index + 1;
                self.contentView.selIndex = [self.sels[self.index] intValue] - 1;
            }
            
            if (self.index == self.contents.count - 1) {
                
                UIButton *tempBtn = [self.view viewWithTag:51];
                [tempBtn setTitle:@"交卷" forState:UIControlStateNormal];
            }
            else {
                
                UIButton *tempBtn = [self.view viewWithTag:51];
                [tempBtn setTitle:@"下一步" forState:UIControlStateNormal];
            }
        }];
    }
    
    self.nextBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.nextBtn.hidden = YES;
    self.nextBtn.frame = CGRectMake(0, self.contentView.maxY, ScreenWidth, 45);
    self.nextBtn.backgroundColor = kMainColor;;
    self.nextBtn.titleLabel.font = [UIFont systemFontOfSize:16];
    [self.nextBtn setTitle:@"下一题" forState:UIControlStateNormal];
    [self.nextBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.view addSubview:self.nextBtn];

    [[self.nextBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
       
        if (self.index == self.contents.count - 1) {
            
            [self.nextBtn setTitle:@"查看成绩" forState:UIControlStateNormal];
        }
        else {
            
            [self.nextBtn setTitle:@"下一题" forState:UIControlStateNormal];
        }
        
        if ([self.nextBtn.titleLabel.text isEqualToString:@"下一题"]) {
            
            self.index += 1;
            ExamContentModel *model = self.contents[self.index];
            [self getExamQuestionsWithId:model.id];
        }
        else {
            
            ExamResultsViewController *vc = [ExamResultsViewController new];
            [self.navigationController pushViewController:vc animated:YES];
        }
    }];
}


#pragma mark - request
- (void)submit {
    
    for (int i = 0; i < self.sels.count; i++) {
        
        if ([self.sels[i] intValue] == 0) {
            return [self.view makeToast:@"请将试题完成再进行交卷操作"];
        }
    }
    
    NSMutableArray *arr = [NSMutableArray array];
    ExamContentModel *tempModel = self.contents[0];
    for (int i = 0; i < tempModel.options.count; i++) {
        
        tempModel = self.contents[i];
        
        int tempIndex = [self.sels[i] intValue] - 1;
        NSString *answer = tempModel.options[tempIndex][@"key"];
        NSDictionary *dict = @{ @"questionId" : tempModel.id,
                                @"answer" : @[answer] };
        [arr addObject:dict];
    }
    
    ExamContentModel *model = [ExamContentModel new];
    model.trainTaskId = self.trainId;
    model.examPaperId = tempModel.examPaperId;
    model.entries = arr;
    [[ExamContentViewModel new] submitExamWithModel:model success:^(NSDictionary *dict) {
        
        self.index = 0;
        ExamContentModel *tempModel = self.contents[self.index];
        [self getExamQuestionsWithId:tempModel.id];
        
    } failure:^(NSError *error) {
        
//        self.index = 0;
//        ExamContentModel *tempModel = self.contents[self.index];
//        [self getExamQuestionsWithId:tempModel.id];
//        [self addNavRightTitle:@"" complete:nil];
    }];
}

// 试题解析
- (void)getExamQuestionsWithId:(NSString *)idString {
    
    self.nextBtn.hidden = NO;
    [[ExamContentViewModel new] examQuestionsWithIdString:idString success:^(NSDictionary *dict) {
        
        ExamContentModel *model = [ExamContentModel new];
        [model setValuesForKeysWithDictionary:dict];
        
        [self.contentView setTitle:model.question content:model.options];
        self.contentView.answers = model.answer;
        self.contentView.analysis = model.analysis;
        
    } failure:^(NSError *error) {}];
}

@end
