//
//  TrainingViewController.m
//  Lywsale
//
//  Created by 黄锡凯 on 2018/10/29.
//  Copyright © 2018 黄锡凯. All rights reserved.
//

#import "TrainingViewController.h"
#import "TrainingView.h"

@interface TrainingViewController ()

@property (nonatomic, strong) UIButton *bottomBtn;
@property (nonatomic, strong) TrainingView *trainingView;
@property (nonatomic, strong) NSString *collectionId;
@property (nonatomic, assign) int ePage;

@end

@implementation TrainingViewController
@synthesize bottomBtn;
@synthesize trainingView;

- (void)viewDidLoad {

    [super viewDidLoad];
    
    self.ePage = 1;
    
    [self getTrains];
    [self getEvaluation];
}
    
- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:animated];
}

- (void)viewWillDisappear:(BOOL)animated {
    
    [super viewWillDisappear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:animated];
}

- (TrainingView *)trainingView {
    
    if (!trainingView) {
        
        trainingView = [[TrainingView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight - self.bottomBtn.height)];
        trainingView.backgroundColor = kPageBgColor;
        [self.view addSubview:self.trainingView];
        
        @weakify(self);
        [trainingView setCollectionBlock:^(BOOL isCollection) {
            
            @strongify(self);
            [self isCollectionTraining:isCollection];
        }];
    }
    
    return trainingView;
}

- (UIButton *)bottomBtn {
    
    if (!bottomBtn) {
        
        bottomBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        bottomBtn.backgroundColor = kMainColor;
        bottomBtn.frame = CGRectMake(0, ScreenHeight - 45, ScreenWidth, 45 * (!self.isCollection));
        bottomBtn.titleLabel.font = [UIFont systemFontOfSize:16];
        [bottomBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [bottomBtn setTitle:@"考  试" forState:UIControlStateNormal];
        [self.view addSubview:bottomBtn];
    }
    
    return bottomBtn;
}


#pragma mark - request
/// 获取培训信息
- (void)getTrains {
    
    [[TrainingViewModel new] getTrainsWithId:self.idString success:^(NSDictionary *dict) {
    
        TrainingModel *model = [TrainingModel new];
        [model setValuesForKeysWithDictionary:dict];
        
        self.collectionId = model.collectionId;
        self.trainingView.model = model;
        
    } failure:^(NSError *error) {
        
    }];
}

/// 获取评价
- (void)getEvaluation {
    
    [[TrainingViewModel new] getEvaluationWithId:self.idString page:self.ePage success:^(NSDictionary *dict) {
        
        NSMutableArray *arr = [NSMutableArray array];
        for (NSDictionary *tempDict in dict[@"list"]) {
            
            EvaluationModel *model = [EvaluationModel new];
            [model setValuesForKeysWithDictionary:tempDict];
            [arr addObject:model];
        }

        [self getEvaluationStatistical:arr];;
        
    } failure:^(NSError *error) {
        
        
    }];
}

/// 获取评价信息
- (void)getEvaluationStatistical:(NSArray *)arr {
    
    [[TrainingViewModel new] getEvaluationStatisticalWithId:self.idString success:^(NSDictionary *dict) {
        
        NSMutableArray *dataSource = [NSMutableArray array];
        for (EvaluationModel *model in arr) {
            
            model.avgScore = [dict valueForKey:@"avgScore"];
            model.evaluationCount = [dict valueForKey:@"evaluationCount"];
            [dataSource addObject:model];
        }
        
        self.trainingView.evaluations = dataSource;
        
    } failure:^(NSError *error) {
        
    }];
}

// 是否收藏
- (void)isCollectionTraining:(BOOL)isCollection {
    
    NSString *idString = isCollection ? self.idString : self.collectionId;
    [[TrainingViewModel new] collectionWithIsCollection:isCollection idString:idString success:^(NSDictionary *dict) {
        
        [self getTrains];
        
    } failure:^(NSError *error) {
        
        [self getTrains];
    }];
}

// 提交评价
- (void)submitEvaluation:(EvaluationModel *)model {
    
    model.id = self.idString;
    
    [[TrainingViewModel new] submitEvaluationWithModel:model success:^(NSDictionary *dict) {
    
        [self getEvaluation];
        
    } failure:^(NSError *error) {
        
        [self getEvaluation];
    }];
}

@end
