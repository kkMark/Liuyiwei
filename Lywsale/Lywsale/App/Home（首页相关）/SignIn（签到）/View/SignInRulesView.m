//
//  SignInRulesView.m
//  Lywsale
//
//  Created by M on 2018/9/25.
//  Copyright © 2018年 黄锡凯. All rights reserved.
//

#import "SignInRulesView.h"

@implementation SignInRulesView

- (void)setupSubviews {
    
    self.alpha = 0;
    self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.3];
    [self addSubview:[self rulesView]];
    
    [UIView animateWithDuration:0.25 animations:^{
        self.alpha = 1;
    }];
}


#pragma mark - UI
- (UIView *)rulesView {
    
    UIView *rulesView = [[UIView alloc] initWithFrame:CGRectMake(15, 0, self.width - 30, 0)];
    rulesView.backgroundColor = [UIColor whiteColor];
    rulesView.layer.cornerRadius = 5;
    rulesView.layer.masksToBounds = YES;
    
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 25, rulesView.width, 0)];
    titleLabel.text = @"签到规则";
    titleLabel.font = [UIFont systemFontOfSize:16];
    titleLabel.textColor = kMainTextColor;
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.height = [titleLabel getTextHeight];
    [rulesView addSubview:titleLabel];
    
    UILabel *contentLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, titleLabel.maxY + 25, rulesView.width - 30, 0)];
    contentLabel.text = @"连续签到的日期不可中断，如日期中断，连续签到的天数会从1天开始重新计算；用户获得连续签到奖励后，连续签到天数会重新计算，并在下一次连续签到满7天时再次获得连签奖励。\n例如：您从6月1日开始每日连续签到，您将在6月7日获得连续签到奖励；6月8日，您的连续签到天数从1天开始重新累计；6月14日，您可再次获得连签7天的积分奖励。";
    contentLabel.font = [UIFont systemFontOfSize:12];
    contentLabel.textColor = [UIColor colorWithHexString:@"0x666666"];
    contentLabel.numberOfLines = 0;
    contentLabel.height = [contentLabel getTextHeight];
    [rulesView addSubview:contentLabel];
    
    UIButton *okBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    okBtn.backgroundColor = kMainColor;
    okBtn.frame = CGRectMake(0, contentLabel.maxY + 50, rulesView.width, 45);
    okBtn.titleLabel.font = [UIFont systemFontOfSize:16];
    [okBtn setTitle:@"知道了" forState:UIControlStateNormal];
    [okBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [[okBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
        [self removeFromSuperview];
    }];
    [rulesView addSubview:okBtn];
    
    rulesView.height = okBtn.maxY;
    rulesView.centerY = self.height / 2;
    return rulesView;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    [UIView animateWithDuration:0.25 animations:^{
        self.alpha = 0;
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}

@end
