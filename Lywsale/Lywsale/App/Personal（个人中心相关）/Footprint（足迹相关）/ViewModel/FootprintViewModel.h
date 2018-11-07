//
//  FootprintViewModel.h
//  Lywsale
//
//  Created by 黄锡凯 on 2018/11/6.
//  Copyright © 2018 黄锡凯. All rights reserved.
//

#import "BaseHttpRequest.h"

@interface FootprintViewModel : BaseHttpRequest

- (void)getLerrningWithPage:(int)page success:(RequestSuccess)success failure:(RequestFailure)failure;

- (void)getCollectionWithPage:(int)page success:(RequestSuccess)success failure:(RequestFailure)failure;

@end
