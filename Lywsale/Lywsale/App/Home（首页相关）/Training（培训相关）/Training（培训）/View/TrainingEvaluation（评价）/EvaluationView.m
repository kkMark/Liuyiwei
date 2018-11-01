//
//  EvaluationView.m
//  Lywsale
//
//  Created by 黄锡凯 on 2018/11/1.
//  Copyright © 2018 黄锡凯. All rights reserved.
//

#import "EvaluationView.h"

@interface EvaluationView ()

@property (nonatomic, strong) UIView *bgView;

@end

@implementation EvaluationView
@synthesize bgView;

- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        
        self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.3];
        self.alpha = 0;
        
        [self setupSubviews];
    }
    
    return self;
}

- (void)setupSubviews {
    
    bgView = [[UIView alloc] initWithFrame:CGRectMake(0, self.height, self.width, 250)];
    bgView.backgroundColor = [UIColor whiteColor];
    bgView.userInteractionEnabled = YES;
    [self addSubview:bgView];
    
    UILabel *titleLabel = [[UILabel alloc] init];
    titleLabel.frame = CGRectMake(20, 25, 0, 15);
    titleLabel.text = @"评分";
    titleLabel.font = [UIFont systemFontOfSize:14];
    titleLabel.textColor = kMainTextColor;
    titleLabel.width = [titleLabel getTextWidth];
    [bgView addSubview:titleLabel];
    
    CGFloat scoreBtnY = 0;
    for (int i = 0; i < 5; i++) {
        
        UIButton *scoreBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        scoreBtn.tag = i + 100;
        scoreBtn.frame = CGRectMake(titleLabel.maxX + 15 + 30 * i, 0, 20, 20);
        scoreBtn.centerY = titleLabel.centerY;
        [scoreBtn setBackgroundImage:[UIImage imageNamed:@"training_score"] forState:UIControlStateNormal];
        [bgView addSubview:scoreBtn];
        
        [[scoreBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
           
            for (int a = 0; a < 5; a++) {
                
                NSString *imgString = @"training_score";
                UIButton *tempBtn = [self viewWithTag:a + 100];
                
                if (a <= i) {
                    imgString = @"training_score_sel";
                }
                
                [tempBtn setBackgroundImage:[UIImage imageNamed:imgString] forState:UIControlStateNormal];
            }
        }];
        
        scoreBtnY = scoreBtn.maxY;
    }
    
    // 文本框
    UITextView *textView = [self textViewWithFrame:CGRectMake(titleLabel.x, scoreBtnY + 20, self.width, 0)];
    textView.height = bgView.height - textView.y - 45;
    [bgView addSubview:textView];
    
    @weakify(self);
    [UIView animateWithDuration:0.25 animations:^{
     
        @strongify(self);
        self.alpha = 1;
        self.bgView.y -= self.bgView.height;
    }];
    
    // 底部按钮
    UIButton *bottomBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    bottomBtn.backgroundColor = kMainColor;
    bottomBtn.frame = CGRectMake(0, bgView.height - 45, bgView.width, 45);
    bottomBtn.titleLabel.font = [UIFont systemFontOfSize:16];
    [bottomBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [bottomBtn setTitle:@"发  送" forState:UIControlStateNormal];
    [bgView addSubview:bottomBtn];
}

- (UITextView *)textViewWithFrame:(CGRect)frame {
    
    // 文本框
    UITextView *textView = [[UITextView alloc] initWithFrame:frame];
    textView.font = [UIFont systemFontOfSize:14];
    textView.textColor = [UIColor blackColor];
    [self addSubview:textView];
    
    // 文本框提示
    UILabel *tipLabel = [[UILabel alloc] initWithFrame:CGRectMake(4, 8.5, textView.width, 15)];
    tipLabel.text = @"请输入评价内容";
    tipLabel.font = [UIFont systemFontOfSize:14];
    tipLabel.textColor = [UIColor colorWithHexString:@"0x999999"];
    tipLabel.numberOfLines = 0;
    tipLabel.height = [tipLabel getTextHeight];
    [textView addSubview:tipLabel];
    
    [[textView rac_textSignal] subscribeNext:^(NSString * _Nullable x) {
        tipLabel.hidden = x.length > 0 ? YES : NO;
    }];
    
    return textView;
}

- (void)close {
    
    [UIView animateWithDuration:0.25 animations:^{
        self.alpha = 0;
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    CGPoint point = [[touches anyObject] locationInView:self];
    point = [self.bgView.layer convertPoint:point fromLayer:self.layer];
    if (![self.bgView.layer containsPoint:point]) {
        [self close];
    }
}

@end
