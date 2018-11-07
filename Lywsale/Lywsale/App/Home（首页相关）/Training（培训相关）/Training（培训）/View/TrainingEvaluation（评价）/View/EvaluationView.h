//
//  EvaluationView.h
//  Lywsale
//
//  Created by 黄锡凯 on 2018/11/1.
//  Copyright © 2018 黄锡凯. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EvaluationView : UIView

@property (nonatomic, copy) void (^evaluationBlock)(NSString *content, int scoce);

@end
