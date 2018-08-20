//
//  SelectTypeCell.h
//  Lywsale
//
//  Created by M on 2018/8/19.
//  Copyright © 2018年 黄锡凯. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SelectTypeModel.h"

@interface SelectTypeCell : UITableViewCell

@property (nonatomic, assign) RegisteredUserType userType;
@property (nonatomic, strong) SelectTypeModel *model;
@property (nonatomic, assign) BOOL isAddNewType;

@end
