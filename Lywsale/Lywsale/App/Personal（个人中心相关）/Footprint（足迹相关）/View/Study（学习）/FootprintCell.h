//
//  FootprintCell.h
//  Lywsale
//
//  Created by 黄锡凯 on 2018/10/26.
//  Copyright © 2018 黄锡凯. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FootprintCell : UITableViewCell

@property (nonatomic, strong) UIButton *statusBtn;

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier;

@end
