
//
//  LearningTaskModel.m
//  Lywsale
//
//  Created by 黄锡凯 on 2018/11/6.
//  Copyright © 2018 黄锡凯. All rights reserved.
//

#import "LearningTaskModel.h"

@implementation LearningTaskModel
@synthesize description;

- (void)setValuesForKeysWithDictionary:(NSDictionary<NSString *,id> *)keyedValues {
    
    [super setValuesForKeysWithDictionary:keyedValues];
    
    NSArray *titles = @[@"startDate", @"endDate"];
    for (int i = 0; i < titles.count; i++) {
        
        NSString *date = [self valueForKey:titles[i]];
        NSArray *arr = [date componentsSeparatedByString:@"."];
        [self setValue:arr[0] forKey:titles[i]];
    }
}

@end
