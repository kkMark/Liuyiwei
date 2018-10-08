//
//  AnnouncenmentTableViewCell.h
//  Lywsale
//
//  Created by 尚洋 on 2018/9/24.
//  Copyright © 2018年 黄锡凯. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AnnouncementModel.h"

@interface AnnouncenmentTableViewCell : UITableViewCell

@property (nonatomic ,copy) AnnouncementModel *model;

@property (nonatomic ,strong) UIView *BGView;

@property (nonatomic ,strong) UILabel *titleLabel;

@property (nonatomic ,strong) UILabel *timeLabel;

@property (nonatomic ,strong) UILabel *contentLabel;

@end
