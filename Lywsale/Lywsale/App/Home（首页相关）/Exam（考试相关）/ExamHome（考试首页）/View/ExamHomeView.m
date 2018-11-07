//
//  ExamHomeView.m
//  Lywsale
//
//  Created by 黄锡凯 on 2018/11/7.
//  Copyright © 2018 黄锡凯. All rights reserved.
//

#import "ExamHomeView.h"

@implementation ExamHomeView

- (void)setModel:(ExamHomeModel *)model {
    
    _model = model;
    [self reloadData];
}

@end
