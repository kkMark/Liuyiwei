//
//  ExamHomeViewModel.h
//  Lywsale
//
//  Created by 黄锡凯 on 2018/11/7.
//  Copyright © 2018 黄锡凯. All rights reserved.
//

#import "BaseHttpRequest.h"
#import "ExamHomeModel.h"

@interface ExamHomeViewModel : BaseHttpRequest

- (void)getExamInfoWithIdString:(NSString *)idString success:(RequestSuccess)success failure:(RequestFailure)failure;

@end
