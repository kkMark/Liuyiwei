//
//  CourseSortTableViewCell.m
//  Lywsale
//
//  Created by 尚洋 on 2018/10/8.
//  Copyright © 2018年 黄锡凯. All rights reserved.
//

#import "CourseSortTableViewCell.h"

@implementation CourseSortTableViewCell

-(void)setCourseSortArray:(NSArray *)courseSortArray{
    
    _courseSortArray = courseSortArray;
    
    [self.BGView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    
    NSInteger integer = 0;
    NSInteger countInteger = 0;
    
    for (int i = 0; i < courseSortArray.count; i++) {
        
        if (countInteger == 2) {
            integer++;
        }
        
        countInteger = i%3;
        
        UIImageView *imageView = [UIImageView new];
        imageView.image = [UIImage imageNamed:@"CourseClassificationBox"];
        imageView.contentMode = UIViewContentModeScaleAspectFit;
        [self.BGView addSubview:imageView];
        
        imageView.sd_layout
        .leftSpaceToView(self.BGView, (ScreenWidth * 0.04) + countInteger * ((ScreenWidth - 25) * 0.266) + countInteger * ((ScreenWidth - 25) * 0.06))
        .topSpaceToView(self.BGView, 10 + integer * 50)
        .widthIs((ScreenWidth - 25) * 0.266)
        .heightIs(30);
        
        NSDictionary *dict = courseSortArray[i];
        
        UILabel *label = [UILabel new];
        label.font = [UIFont systemFontOfSize:13.5];
        label.text = dict[@"title"];
        [imageView addSubview:label];
        
        label.sd_layout
        .centerXEqualToView(imageView)
        .centerYEqualToView(imageView)
        .heightIs(13.5);
        [label setSingleLineAutoResizeWithMaxWidth:imageView.width];
        
    }
    
    self.BGView.sd_resetLayout
    .centerXEqualToView(self.contentView)
    .topSpaceToView(self.contentView, 0)
    .heightIs(60 + integer * 50)
    .widthIs(ScreenWidth - 25);
    
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self setupUI];
    }
    
    return self;
}

-(void)setupUI{
    
    self.BGView = [UIView new];
    self.BGView.backgroundColor = [UIColor whiteColor];
    [self.contentView addSubview:self.BGView];
    
    self.BGView.sd_layout
    .centerXEqualToView(self.contentView)
    .topSpaceToView(self.contentView, 0)
    .heightIs(100)
    .widthIs(ScreenWidth - 25);
    
    [self setupAutoHeightWithBottomView:self.BGView bottomMargin:10];
    
}

@end
