//
//  AnnouncenmentTableViewCell.m
//  Lywsale
//
//  Created by 尚洋 on 2018/9/24.
//  Copyright © 2018年 黄锡凯. All rights reserved.
//

#import "AnnouncenmentTableViewCell.h"

@implementation AnnouncenmentTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        [self setupUI];
        
    }
    
    return self;
}

-(void)setModel:(AnnouncementModel *)model{
    
    _model = model;
    
    self.titleLabel.text = model.title;
    
    self.timeLabel.text = model.time;
    
    self.contentLabel.text = model.content;
    
    CGFloat contentFloat = [self heightForString:self.contentLabel.text andWidth:ScreenWidth-25];
    
    self.BGView.sd_resetLayout
    .centerXEqualToView(self.contentView)
    .topSpaceToView(self.contentView, 0)
    .widthIs(ScreenWidth - 25)
    .heightIs(80.5 + contentFloat);
    
}

/**
 @method 获取指定宽度width,字体大小fontSize,字符串value的高度
 @param value 待计算的字符串
 @result float 返回的高度
 */
- (float) heightForString:(NSString *)value andWidth:(float)width{
    //获取当前文本的属性
    NSAttributedString *attrStr = [[NSAttributedString alloc] initWithString:value];
    NSRange range = NSMakeRange(0, attrStr.length);
    // 获取该段attributedString的属性字典
    NSDictionary *dic = [attrStr attributesAtIndex:0 effectiveRange:&range];
    // 计算文本的大小
    CGSize sizeToFit = [value boundingRectWithSize:CGSizeMake(width - 16.0, MAXFLOAT) // 用于计算文本绘制时占据的矩形块
                                           options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading // 文本绘制时的附加选项
                                        attributes:dic        // 文字的属性
                                           context:nil].size; // context上下文。包括一些信息，例如如何调整字间距以及缩放。该对象包含的信息将用于文本绘制。该参数可为nil
    return sizeToFit.height + 16.0;
}

-(void)setupUI{
    
    self.BGView = [UIView new];
    self.BGView.backgroundColor = [UIColor whiteColor];
    [self.contentView addSubview:self.BGView];
    
    self.BGView.sd_layout
    .centerXEqualToView(self.contentView)
    .topSpaceToView(self.contentView, 0)
    .widthIs(ScreenWidth - 25)
    .heightIs(100);
    
    self.titleLabel = [UILabel new];
    self.titleLabel.font = [UIFont systemFontOfSize:16];
    [self.BGView addSubview:self.titleLabel];
    
    self.titleLabel.sd_layout
    .leftSpaceToView(self.BGView, 15)
    .topSpaceToView(self.BGView, 15)
    .heightIs(16);
    [self.titleLabel setSingleLineAutoResizeWithMaxWidth:self.BGView.width - 30];
    
    self.timeLabel = [UILabel new];
    self.timeLabel.font = [UIFont systemFontOfSize:9.5];
    self.timeLabel.textColor = RGB(153, 153, 153);
    [self.BGView addSubview:self.timeLabel];
    
    self.timeLabel.sd_layout
    .leftSpaceToView(self.BGView, 15)
    .topSpaceToView(self.titleLabel, 10)
    .heightIs(9.5);
    [self.timeLabel setSingleLineAutoResizeWithMaxWidth:self.BGView.width - 30];
    
    self.contentLabel = [UILabel new];
    self.contentLabel.font = [UIFont systemFontOfSize:12];
    self.contentLabel.textColor = RGB(102, 102, 102);
    [self.BGView addSubview:self.contentLabel];
    
    self.contentLabel.sd_layout
    .leftSpaceToView(self.BGView, 15)
    .rightSpaceToView(self.BGView, 15)
    .topSpaceToView(self.timeLabel, 10)
    .autoHeightRatio(0);
    
    [self setupAutoHeightWithBottomView:self.BGView bottomMargin:0];
    
}

@end
