//
//  UploadCredentialsView.m
//  Lywsale
//
//  Created by M on 2018/9/21.
//  Copyright © 2018年 黄锡凯. All rights reserved.
//

#import "UploadCredentialsView.h"

@implementation UploadCredentialsView

- (void)setupSubviews {
    
    self.backgroundColor = [UIColor whiteColor];
    
    UIView *timeView = [self titleView:@"上传时间" content:@"2018-06-14 22:00" placeholder:@""];
    [self addSubview:timeView];
    
    UIView *remarkView = [self titleView:@"备注" content:@"" placeholder:@"请输入备注信息"];
    remarkView.y = timeView.maxY;
    [self addSubview:remarkView];
    
    UIView *attachmentView = [self attachmentView:@[@"", @"", @"", @"", @"", @""]];
    attachmentView.y = remarkView.maxY;
    [self addSubview:attachmentView];
}

#pragma mark - UI
- (UIView *)titleView:(NSString *)title content:(NSString *)content placeholder:(NSString *)placeholder {
    
    UIView *bgView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 45)];
    
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, 0, 60, bgView.height)];
    titleLabel.text = title;
    titleLabel.font = [UIFont systemFontOfSize:14];
    titleLabel.textColor = kMainTextColor;
    [bgView addSubview:titleLabel];
    
    UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(titleLabel.maxX + 15, 0, 0, bgView.height)];
    textField.width = bgView.width - textField.x;
    textField.font = [UIFont systemFontOfSize:14];
    textField.placeholder = placeholder;
    textField.text = content;
    textField.clearButtonMode = UITextFieldViewModeWhileEditing;
    textField.enabled = [title isEqualToString:@"备注"] ? YES : NO;
    [bgView addSubview:textField];
    
    UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, bgView.height - 0.5, ScreenWidth, 0.5)];
    lineView.backgroundColor = [UIColor colorWithHexString:@"0xC8CEE9"];
    [bgView addSubview:lineView];
    
    return bgView;
}

- (UIView *)attachmentView:(NSArray *)imgs {
    
    UIView *bgView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 0)];
    bgView.backgroundColor = [UIColor whiteColor];
    
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, 0, ScreenWidth, 45)];
    titleLabel.text = @"晒票-上传附件（最多不超过6张）";
    titleLabel.font = [UIFont systemFontOfSize:14];
    titleLabel.textColor = kMainTextColor;
    [bgView addSubview:titleLabel];
    
    float imgWidth = (bgView.width - 75) / 4;
    float y = titleLabel.maxY;
    for (int i = 0; i < imgs.count; i++) {
        
        y = titleLabel.maxY + (imgWidth + 15) * (i / 4);
        
        UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(15 + (imgWidth + 15) * (i % 4), y, imgWidth, imgWidth)];
        [bgView addSubview:imgView];
        
        // 相机图片
        UIImageView *cameraImgView = [self cameraImgView];
        cameraImgView.center = CGPointMake(imgWidth / 2, imgWidth / 2);
        [imgView addSubview:cameraImgView];
        
        // 加载图片
        if ([imgs[i] length] > 0) {
            
            cameraImgView.hidden = YES;
            [imgView sd_setImageWithURL:[NSURL URLWithString:imgs[i]]];
        }
        else {
            
            cameraImgView.hidden = NO;
            imgView.image = [UIImage imageNamed:@"cameraBgImg"];
        }
        
        bgView.height = imgView.maxY + 15;
    }
    
    return bgView;
}

- (UIImageView *)cameraImgView {
    
    // 背景图片
    UIImageView *cameraBgImgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 60, 60)];
    [self addSubview:cameraBgImgView];
    
    // 相机图片
    UIImage *cameraImg = [UIImage imageNamed:@"cameraImg"];
    UIImageView *cameraImgView = [[UIImageView alloc] initWithImage:cameraImg];
    cameraImgView.frame = CGRectMake(0, 10, 24, 24);
    cameraImgView.centerX = cameraBgImgView.width / 2;
    [cameraBgImgView addSubview:cameraImgView];
    
    // 相机文本
    UILabel *cameraLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, cameraImgView.maxY + 5, cameraBgImgView.width, 0)];
    cameraLabel.text = @"上传图片";
    cameraLabel.font = [UIFont systemFontOfSize:10];
    cameraLabel.textColor = [UIColor colorWithHexString:@"0x666666"];
    cameraLabel.textAlignment = NSTextAlignmentCenter;
    cameraLabel.height = [cameraLabel getTextHeight];
    [cameraBgImgView addSubview:cameraLabel];
    
    return cameraBgImgView;
}

@end
