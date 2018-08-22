//
//  WriteInfoTypeCell.h
//  Lywsale
//
//  Created by M on 2018/8/22.
//  Copyright © 2018年 黄锡凯. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WriteInfoTypeCell : UITableViewCell

@property (nonatomic, strong) void (^selectBlock)(NSInteger index);

@end
