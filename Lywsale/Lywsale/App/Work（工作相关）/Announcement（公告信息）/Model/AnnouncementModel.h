//
//  AnnouncementModel.h
//  Lywsale
//
//  Created by 尚洋 on 2018/10/8.
//  Copyright © 2018年 黄锡凯. All rights reserved.
//

#import "BaseModel.h"

@interface AnnouncementModel : BaseModel

@property (nonatomic ,copy) NSString *time;

@property (nonatomic ,copy) NSString *title;

@property (nonatomic ,copy) NSString *content;

@end
