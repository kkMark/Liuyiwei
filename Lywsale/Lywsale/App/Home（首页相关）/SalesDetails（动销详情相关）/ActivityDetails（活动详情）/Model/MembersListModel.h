//
//  MembersListModel.h
//  Lywsale
//
//  Created by 黄锡凯 on 2018/11/6.
//  Copyright © 2018 黄锡凯. All rights reserved.
//

#import "BaseModel.h"

@interface MembersListModel : BaseModel

@property (nonatomic, strong) NSString *clerkId;
@property (nonatomic, strong) NSString *clerkName;
@property (nonatomic, strong) NSString *clerkPicture;
@property (nonatomic, strong) NSString *mobilePhone;

@end
