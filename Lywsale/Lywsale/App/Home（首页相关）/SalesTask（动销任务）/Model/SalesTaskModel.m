//
//  SalesTaskModel.m
//  Lywsale
//
//  Created by 黄锡凯 on 2018/10/12.
//  Copyright © 2018 黄锡凯. All rights reserved.
//

#import "SalesTaskModel.h"

@implementation SalesTaskModel
@synthesize description;

- (void)setValuesForKeysWithDictionary:(NSDictionary<NSString *,id> *)keyedValues {
    
    [super setValuesForKeysWithDictionary:keyedValues];
    
    self.strategiesModel = [StrategiesModel new];
    
    NSArray *arr = keyedValues[@"strategies"];
    if (arr.count > 0) {
        [self.strategiesModel setValuesForKeysWithDictionary:arr[0]];
    }
}

@end

@implementation StrategiesModel


@end
