//
//  GoodsViewController.m
//  Lywsale
//
//  Created by 尚洋 on 2018/10/8.
//  Copyright © 2018年 黄锡凯. All rights reserved.
//

#import "GoodsViewController.h"
#import "BaseTextField.h"

@interface GoodsViewController ()

///验证码View
@property (nonatomic ,strong) UIView *codeView;
///验证码
@property (nonatomic ,copy) NSString *codeString;
//验证码输入
@property (nonatomic ,strong) BaseTextField *codeTextField;

@end

@implementation GoodsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"手动提货";
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textFieldTextChange:) name:UITextFieldTextDidChangeNotification object:nil];
    
    [self initUI];
    
}

-(void)initUI{
    
    UILabel *titleLabel = [UILabel new];
    titleLabel.text = @"请输入提货码";
    titleLabel.font = [UIFont systemFontOfSize:16];
    titleLabel.textColor = RGB(0, 0, 0);
    [self.view addSubview:titleLabel];
    
    titleLabel.sd_layout
    .centerXEqualToView(self.view)
    .topSpaceToView(self.view, 41)
    .heightIs(16);
    [titleLabel setSingleLineAutoResizeWithMaxWidth:300];
    
    self.codeView = [UIView new];
    [self.view addSubview:self.codeView];
    
    self.codeView.sd_layout
    .leftSpaceToView(self.view, 0)
    .rightSpaceToView(self.view, 0)
    .topSpaceToView(titleLabel, 100)
    .heightIs(80);
    
    for (int i = 0; i < 5; i++) {
        
        UILabel *label = [UILabel new];
        label.textColor = RGB(81, 103, 241);
        label.font = [UIFont systemFontOfSize:20];
        label.textAlignment = NSTextAlignmentCenter;
        label.tag = i + 100;
        [self.codeView addSubview:label];
        
        label.sd_layout
        .leftSpaceToView(self.codeView, (ScreenWidth * 0.06) + i * (ScreenWidth * 0.147) + i * (ScreenWidth * 0.045))
        .topSpaceToView(self.codeView, 10)
        .widthIs(ScreenWidth * 0.147)
        .heightEqualToWidth();
        
        UIView *lineView = [UIView new];
        lineView.backgroundColor = kLineColor;
        lineView.tag = i + 200;
        [self.codeView addSubview:lineView];
        
        lineView.sd_layout
        .centerXEqualToView(label)
        .topSpaceToView(label, 5)
        .widthIs(ScreenWidth * 0.0875)
        .heightIs(1);
        
    }
    
    self.codeTextField = [BaseTextField textFieldWithPlaceHolder:nil headerViewText:nil];
    self.codeTextField.textColor = [UIColor clearColor];
    self.codeTextField.tintColor = [UIColor clearColor];
    self.codeTextField.keyboardType = UIKeyboardTypeNumberPad;
    [self.view addSubview:self.codeTextField];
    
    self.codeTextField.sd_layout
    .leftSpaceToView(self.view, (ScreenWidth * 0.06))
    .rightSpaceToView(self.view, (ScreenWidth * 0.06))
    .heightIs(80)
    .centerYEqualToView(self.codeView);
    
    @weakify(self);
    [[self.codeTextField rac_textSignal] subscribeNext:^(id x) {
        @strongify(self);
        if (self.codeTextField.text.length > 6) {
            self.codeTextField.text = [self.codeTextField.text substringFromIndex:6];
        }
    }];
    
    [self.codeTextField becomeFirstResponder];
    
}

-(void)textFieldTextChange:(NSNotification *)sender{
    
    self.codeString = self.codeTextField.text;
    
    for (int i = 0; i < 5; i++) {
        
        UILabel *label = [self.view viewWithTag:i + 100];
        
        if (self.codeString.length > i) {
            
            NSString *labelString = [self.codeString substringWithRange:NSMakeRange(i, 1)];
            label.text = labelString;
            
        }else{
            
            label.text = @"";
            
        }
        
    }
    
    if (self.codeString.length == 5) {
        [[NSNotificationCenter defaultCenter]removeObserver:self];
        
        
    }
    
}

@end
