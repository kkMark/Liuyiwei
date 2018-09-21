//
//  UploadImgCell.m
//  Lywsale
//
//  Created by M on 2018/9/21.
//  Copyright © 2018年 黄锡凯. All rights reserved.
//

#import "UploadImgCell.h"

@implementation UploadImgCell

- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        
        [self setupSubviews];
    }
    
    return self;
}

- (void)setupSubviews {
    
    NSArray *arr = @[@"审核中", @"审核通过", @"审核不通过"];
    
    float width = (ScreenWidth - 90) / 3;
    UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, width, width)];
    imgView.image = [UIImage imageNamed:@"Test-Img"];
    imgView.contentMode = UIViewContentModeScaleAspectFill;
    imgView.clipsToBounds = YES;
    [self.contentView addSubview:imgView];
    
    UILabel *stateLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, imgView.maxY + 8, width, 20)];
    stateLabel.text = arr[arc4random() % 3];
    stateLabel.font = [UIFont systemFontOfSize:14];
    stateLabel.textColor = kMainTextColor;
    stateLabel.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:stateLabel];
    
    if ([stateLabel.text isEqualToString:@"审核不通过"]) {
        stateLabel.textColor = [UIColor colorWithHexString:@"0xE60012"];
    }
}

@end
