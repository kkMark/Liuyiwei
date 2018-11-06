//
//  ActivityDetailsViewModel.h
//  Lywsale
//
//  Created by 黄锡凯 on 2018/11/5.
//  Copyright © 2018 黄锡凯. All rights reserved.
//

#import "BaseHttpRequest.h"
#import "SalesTaskModel.h"

@interface ActivityDetailsViewModel : BaseHttpRequest

- (void)getDataSourceWithId:(NSString *)idString success:(RequestSuccess)success failure:(RequestFailure)failure;

- (void)getMembersListWithSuccess:(RequestSuccess)success failure:(RequestFailure)failure;

@end
