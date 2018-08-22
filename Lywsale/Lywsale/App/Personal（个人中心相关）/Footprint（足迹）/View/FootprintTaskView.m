//
//  FootprintTaskView.m
//  Lywsale
//
//  Created by M on 2018/8/22.
//  Copyright © 2018年 黄锡凯. All rights reserved.
//

#import "FootprintTaskView.h"

@implementation FootprintTaskView

- (void)setupSubviews {
    
    [self searchView];
}

// 搜索
- (void)searchView {
    
    float width = ScreenWidth / 3;
    for (int i = 0; i < 2; i++) {
        
        UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(15 + (width + 30) * i, 0, width, 25)];
        textField.font = [UIFont systemFontOfSize:14];
        textField.clearButtonMode = UITextFieldViewModeWhileEditing;
        [self addSubview:textField];
    }
}

@end
