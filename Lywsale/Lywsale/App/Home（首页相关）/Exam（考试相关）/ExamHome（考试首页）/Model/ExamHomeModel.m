//
//  ExamHomeModel.m
//  Lywsale
//
//  Created by 黄锡凯 on 2018/11/7.
//  Copyright © 2018 黄锡凯. All rights reserved.
//

#import "ExamHomeModel.h"

@implementation ExamHomeModel
@synthesize description;

- (void)setValuesForKeysWithDictionary:(NSDictionary<NSString *,id> *)keyedValues {
    
    [super setValuesForKeysWithDictionary:keyedValues];
    
    NSMutableArray *arr = [NSMutableArray array];
    for (NSDictionary *dict in self.questions) {
        
        QuestionModel *model = [QuestionModel new];
        [model setValuesForKeysWithDictionary:dict];
        [arr addObject:model];
    }
    
    self.questions = arr;
}

@end

@implementation QuestionModel

- (void)setValuesForKeysWithDictionary:(NSDictionary<NSString *,id> *)keyedValues {
    
    [super setValuesForKeysWithDictionary:keyedValues];
    
    NSMutableArray *arr = [NSMutableArray array];
    for (NSDictionary *dict in self.options) {
        
        OptionModel *model = [OptionModel new];
        [model setValuesForKeysWithDictionary:dict];
        [arr addObject:model];
    }
    
    self.options = arr;
}

@end

@implementation OptionModel

@end
