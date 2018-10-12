
//
//  GradientRound.m
//  Lywsale
//
//  Created by 尚洋 on 2018/10/12.
//  Copyright © 2018年 黄锡凯. All rights reserved.
//

#import "GradientRound.h"

@interface GradientRound()

//进度圆环
@property (nonatomic, strong) CAShapeLayer *shapeLayer;

@property (nonatomic, strong)CAGradientLayer *gradientLayer;

@end

@implementation GradientRound

- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        
//        [self initUI];
    }
    
    return self;
}

- (void)addCircleWithColor:(UIColor *)color{
    
    const CGFloat *components = CGColorGetComponents(color.CGColor);
    
    UIBezierPath *circlePath = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(5, 5, self.width-10, self.height-10)];
    
    CAShapeLayer *bgLayer = [CAShapeLayer layer];
    bgLayer.frame = CGRectMake(0, 0, self.width, self.height);
    bgLayer.fillColor = [UIColor clearColor].CGColor;//填充色 -  透明色
    bgLayer.lineWidth = 10.f;
    bgLayer.strokeColor = RGB(212, 212, 212).CGColor;//线条颜色
    bgLayer.strokeStart = 0;
    bgLayer.strokeEnd = 1;
    bgLayer.lineCap = kCALineCapRound;
    bgLayer.path = circlePath.CGPath;
    [self.layer addSublayer:bgLayer];
    
    //一个红色进度
    self.shapeLayer = [CAShapeLayer layer];
    self.shapeLayer.frame = CGRectMake(0, 0, self.width, self.height);
    self.shapeLayer.fillColor = [UIColor clearColor].CGColor;
    self.shapeLayer.lineWidth = 10.f;
    self.shapeLayer.lineCap = kCALineCapRound;
    self.shapeLayer.strokeColor = color.CGColor;
//    self.shapeLayer.strokeColor = [UIColor blueColor].CGColor;
    self.shapeLayer.strokeStart = 0;
    self.shapeLayer.strokeEnd = 0;
    self.shapeLayer.path = circlePath.CGPath;
    [self.layer addSublayer:self.shapeLayer];
    
    self.gradientLayer = [CAGradientLayer layer];
    
    //左边的渐变图层
    CAGradientLayer *leftGradientLayer = [CAGradientLayer layer];
    leftGradientLayer.frame = CGRectMake(0, 0, self.width, self.height);
    [leftGradientLayer setColors:[NSArray arrayWithObjects:(id)RGBA(components[0] * 255, components[1] * 255, components[2] * 255, 1).CGColor, (id)RGBA(components[0] * 255, components[1] * 255 / 2, components[2] * 255, 1).CGColor, nil]];
    [leftGradientLayer setLocations:@[@0,@1]];
    [leftGradientLayer setStartPoint:CGPointMake(0, 1)];
    [leftGradientLayer setEndPoint:CGPointMake(1, 0)];
    [self.gradientLayer addSublayer:leftGradientLayer];
    
    
    CAGradientLayer *rightGradientLayer = [CAGradientLayer layer];
    rightGradientLayer.frame = CGRectMake(self.width, 0, self.width, self.height);
    [rightGradientLayer setColors:[NSArray arrayWithObjects:(id)RGBA(components[0] * 255, components[1] * 255 / 3, components[2] * 255, 1.0).CGColor, (id)RGBA(components[0] * 255, components[1] * 255 / 3, components[2] * 255, 1.0).CGColor, nil]];
    [rightGradientLayer setLocations:@[@0.1, @1]];
    [rightGradientLayer setStartPoint:CGPointMake(1, 0)];
    [rightGradientLayer setEndPoint:CGPointMake(0.5, 1)];
    [self.gradientLayer addSublayer:rightGradientLayer];
    
    [self.gradientLayer setMask:self.shapeLayer];
    
    self.gradientLayer.frame = self.bounds;
    //渐变图层映射到进度条路径上面
    
    [self.layer addSublayer:self.gradientLayer];
    
}

- (void)animateToProgress:(CGFloat)progress{
    
    //    NSLog(@"增加到progress%lf", progress);
    
    if(_shapeLayer.strokeEnd != 0){
        [self animateToZero];
    }
    
    __weak typeof(self)weakSelf = self;
    
    NSLog(@"-----%lf",_shapeLayer.strokeEnd);
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(_shapeLayer.strokeEnd * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        [weakSelf deleteTimer];
        
        NSString *progressStr = [NSString stringWithFormat:@"%lf",progress];
        
        NSDictionary *userInfo = @{@"progressStr":progressStr};
        
        weakSelf.timer = [NSTimer scheduledTimerWithTimeInterval:0.01 target:weakSelf selector:@selector(animate:) userInfo:userInfo repeats:YES];
    });
    
}

- (void)animate:(NSTimer *)time{
    
    CGFloat progress = [[time.userInfo objectForKey:@"progressStr"]  floatValue];
    
    if(self.shapeLayer.strokeEnd <= progress)
    {
        self.shapeLayer.strokeEnd += 0.01;
    }else{
        [self deleteTimer];
    }
}

//回滚到0  先判断 timer 有没有存在 存在 就把timer 删除
- (void)animateToZero{
    
    //    NSLog(@"删除到0");
    
    [self deleteTimer];
    
    self.timer = [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(animateReset) userInfo:nil repeats:YES];
}

- (void)animateReset{
    
    if(self.shapeLayer.strokeEnd > 0){
        self.shapeLayer.strokeEnd -= 0.01;
    }else{
        [self deleteTimer];
    }
    
}

- (void)deleteTimer{
    [self.timer invalidate];
    self.timer = nil;
}

@end
