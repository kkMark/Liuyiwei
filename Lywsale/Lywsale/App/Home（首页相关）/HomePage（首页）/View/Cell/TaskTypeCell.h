//
//  TaskTypeCell.h
//  Lywsale
//
//  Created by M on 2018/9/4.
//  Copyright © 2018年 黄锡凯. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TaskTypeCell : UITableViewCell

@property (nonatomic, strong) void (^goViewControllerBlock)(UIViewController *vc);

@end
