//
//  SalesTaskCell.h
//  Lywsale
//
//  Created by M on 2018/8/28.
//  Copyright © 2018年 黄锡凯. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SalesTaskModel.h"

@interface SalesTaskCell : UITableViewCell

@property (nonatomic, assign) float cellHeight;
@property (nonatomic, strong) SalesTaskModel *model;

@end
