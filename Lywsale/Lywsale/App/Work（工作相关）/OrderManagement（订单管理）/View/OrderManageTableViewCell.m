//
//  OrderManageTableViewCell.m
//  Lywsale
//
//  Created by 尚洋 on 2018/10/9.
//  Copyright © 2018年 黄锡凯. All rights reserved.
//

#import "OrderManageTableViewCell.h"

@implementation OrderManageTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        [self setupUI];
        
    }
    
    return self;
}

-(void)setModel:(OrderManageModel *)model{
    
    _model = model;
    
    self.ordermainIdLabel.text = [NSString stringWithFormat:@"订单号：%@",model.ordermainId];
    
    self.customerInformationLabel.text = [NSString stringWithFormat:@"客户：%@",model.customerInformation];
    
    self.timeLabel.text = [NSString stringWithFormat:@"购买日期：%@",model.time];
    
    self.distributionLabel.text = [NSString stringWithFormat:@"配送方式：%@",model.distribution];
    
    self.amountLabel.text = [NSString stringWithFormat:@"金额：%ld",model.amount];
    
    if ([model.curStatusId isEqualToString:@"0000"]) {
        self.curStatusIdLabel.text = @"待付款";
        self.curStatusIdLabel.textColor = RGB(246, 115, 62);
    }else if ([model.curStatusId isEqualToString:@"0001"]){
        self.curStatusIdLabel.text = @"已付款";
        self.curStatusIdLabel.textColor = RGB(81, 103, 241);
    }else if ([model.curStatusId isEqualToString:@"0003"]){
        self.curStatusIdLabel.text = @"待付款";
        self.curStatusIdLabel.textColor = RGB(246, 115, 62);
    }else if ([model.curStatusId isEqualToString:@"0005"]){
        self.curStatusIdLabel.text = @"待付款";
        self.curStatusIdLabel.textColor = RGB(246, 115, 62);
    }else if ([model.curStatusId isEqualToString:@"0007"]){
        self.curStatusIdLabel.text = @"已完成";
        self.curStatusIdLabel.textColor = RGB(51, 51, 51);
    }else if ([model.curStatusId isEqualToString:@"0009"]){
        self.curStatusIdLabel.text = @"待付款";
        self.curStatusIdLabel.textColor = RGB(246, 115, 62);
    }
 
}

-(void)setupUI{
    
    self.BGView = [UIView new];
    self.BGView.backgroundColor = [UIColor whiteColor];
    [self.contentView addSubview:self.BGView];
    
    self.BGView.sd_layout
    .centerXEqualToView(self.contentView)
    .topSpaceToView(self.contentView, 0)
    .widthIs(ScreenWidth - 25)
    .heightIs(115);
    
    
    self.ordermainIdLabel = [UILabel new];
    self.ordermainIdLabel.font = [UIFont systemFontOfSize:13];
    [self.BGView addSubview:self.ordermainIdLabel];
    
    self.ordermainIdLabel.sd_layout
    .leftSpaceToView(self.BGView, 12.5)
    .topSpaceToView(self.BGView, 17)
    .heightIs(13);
    [self.ordermainIdLabel setSingleLineAutoResizeWithMaxWidth:300];
    
    
    self.curStatusIdLabel = [UILabel new];
    self.curStatusIdLabel.font = [UIFont systemFontOfSize:13];
    [self.BGView addSubview:self.curStatusIdLabel];
    
    self.curStatusIdLabel.sd_layout
    .rightSpaceToView(self.BGView, 18)
    .topSpaceToView(self.BGView, 17)
    .heightIs(13);
    [self.curStatusIdLabel setSingleLineAutoResizeWithMaxWidth:100];
    
    UIView *lineView = [UIView new];
    lineView.backgroundColor = RGB(238, 240, 243);
    [self.BGView addSubview:lineView];
    
    lineView.sd_layout
    .leftSpaceToView(self.BGView, 0)
    .rightSpaceToView(self.BGView, 0)
    .topSpaceToView(self.ordermainIdLabel, 11.5)
    .heightIs(0.5);
    
    
    self.customerInformationLabel = [UILabel new];
    self.customerInformationLabel.font = [UIFont systemFontOfSize:11.5];
    self.customerInformationLabel.textColor = RGB(102, 102, 102);
    [self.BGView addSubview:self.customerInformationLabel];
    
    self.customerInformationLabel.sd_layout
    .leftSpaceToView(self.BGView, 12.5)
    .topSpaceToView(lineView, 15)
    .heightIs(11.5);
    [self.customerInformationLabel setSingleLineAutoResizeWithMaxWidth:200];
    
    
    self.timeLabel = [UILabel new];
    self.timeLabel.font = [UIFont systemFontOfSize:11.5];
    self.timeLabel.textColor = RGB(102, 102, 102);
    [self.BGView addSubview:self.timeLabel];
    
    self.timeLabel.sd_layout
    .leftSpaceToView(self.BGView, self.BGView.width/2)
    .topSpaceToView(lineView, 15)
    .heightIs(11.5);
    [self.timeLabel setSingleLineAutoResizeWithMaxWidth:200];
    
    
    self.distributionLabel = [UILabel new];
    self.distributionLabel.font = [UIFont systemFontOfSize:11.5];
    self.distributionLabel.textColor = RGB(102, 102, 102);
    [self.BGView addSubview:self.distributionLabel];
    
    self.distributionLabel.sd_layout
    .leftSpaceToView(self.BGView, 12.5)
    .topSpaceToView(self.customerInformationLabel, 15)
    .heightIs(11.5);
    [self.distributionLabel setSingleLineAutoResizeWithMaxWidth:200];
    
    
    self.amountLabel = [UILabel new];
    self.amountLabel.font = [UIFont systemFontOfSize:11.5];
    self.amountLabel.textColor = RGB(102, 102, 102);
    [self.BGView addSubview:self.amountLabel];
    
    self.amountLabel.sd_layout
    .leftSpaceToView(self.BGView, self.BGView.width/2)
    .topSpaceToView(self.customerInformationLabel, 15)
    .heightIs(11.5);
    [self.amountLabel setSingleLineAutoResizeWithMaxWidth:200];
    
    [self setupAutoHeightWithBottomView:self.BGView bottomMargin:0];
    
}

@end
