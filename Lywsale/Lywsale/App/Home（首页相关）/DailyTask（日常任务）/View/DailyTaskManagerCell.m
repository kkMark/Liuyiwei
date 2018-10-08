//
//  DailyTaskManagerCell.m
//  Lywsale
//
//  Created by 黄锡凯 on 2018/10/8.
//  Copyright © 2018 黄锡凯. All rights reserved.
//

#import "DailyTaskManagerCell.h"

@interface DailyTaskManagerCell ()

/// 标题
@property (nonatomic, strong) UILabel *titleLabel;
/// 任务数量
@property (nonatomic, strong) UILabel *numberLabel;
/// 状态图标
@property (nonatomic, strong) UIImageView *stateImgView;

@end

@implementation DailyTaskManagerCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self setupSubviews];
    }
    
    return self;
}

- (void)setupSubviews {
    
    
}

@end
