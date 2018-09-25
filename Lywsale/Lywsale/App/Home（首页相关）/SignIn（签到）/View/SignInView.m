//
//  SignInView.m
//  Lywsale
//
//  Created by M on 2018/9/22.
//  Copyright © 2018年 黄锡凯. All rights reserved.
//

#import "SignInView.h"

@implementation SignInView

- (void)setupSubviews {
 
    self.backgroundColor = kPageBgColor;
    
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:self.frame];
    [self addSubview:scrollView];
    
    UIView *headerView = [self headerView];
    [scrollView addSubview:headerView];
    
    UIView *dateView = [self dateView];
    dateView.y = headerView.maxY + 10;
    [scrollView addSubview:dateView];
    
    scrollView.contentSize = CGSizeMake(0, dateView.maxY);
}

#pragma mark - UI
- (UIView *)headerView {
    
    UIView *bgView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 0)];
    bgView.backgroundColor = [UIColor whiteColor];
    
    UIImage *img = [UIImage imageNamed:@"signIn"];
    UIImageView *imageView = [[UIImageView alloc] initWithImage:img];
    imageView.size = img.size;
    imageView.centerX = bgView.centerX;
    imageView.y = 15;
    [bgView addSubview:imageView];
    
    NSArray *titles = @[@"恭喜你", @"签到成功，记得明天再来领积分哦"];
    float y = imageView.maxY + 10;
    for (int i = 0; i < 2; i++) {
        
        UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, y, ScreenWidth, 0)];
        titleLabel.text = titles[i];
        titleLabel.font = [UIFont systemFontOfSize:16 - i * 2];
        titleLabel.textColor = kMainTextColor;
        titleLabel.textAlignment = NSTextAlignmentCenter;
        titleLabel.height = [titleLabel getTextHeight];
        [bgView addSubview:titleLabel];
        
        y = titleLabel.maxY + 10;
    }
    
    // 签到天数
    UILabel *dayLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, y, 0, 15)];
    dayLabel.text = @"已连续签到X天";
    dayLabel.font = [UIFont systemFontOfSize:14];
    dayLabel.textColor = [UIColor colorWithHexString:@"0x666666"];
    dayLabel.textAlignment = NSTextAlignmentCenter;
    dayLabel.width = [dayLabel getTextWidth];
    dayLabel.centerX = bgView.centerX;
    [bgView addSubview:dayLabel];
    
    for (int i = 0; i < 2; i++) {
        
        UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 25, 1)];
        lineView.x = i == 0 ? dayLabel.x - 50 : dayLabel.maxX + 25;
        lineView.centerY = dayLabel.centerY;
        lineView.backgroundColor = [UIColor colorWithHexString:@"0x999999"];
        [bgView addSubview:lineView];
    }
    
    // 分数
    UILabel *numberLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, dayLabel.maxY + 15, ScreenWidth, 15)];
    numberLabel.text = @"再签X天，可额外获得XX积分哦！";
    numberLabel.font = [UIFont systemFontOfSize:12];
    numberLabel.textColor = [UIColor colorWithHexString:@"0xF5A520"];
    numberLabel.textAlignment = NSTextAlignmentCenter;
    numberLabel.height = [numberLabel getTextHeight];
    [bgView addSubview:numberLabel];
    
    bgView.height = numberLabel.maxY + 15;
    return bgView;
}

- (UIView *)dateView {

    NSDateFormatter * dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    
    NSString *currentDate = [dateFormatter stringFromDate:[NSDate date]];
    NSArray *dates = [currentDate componentsSeparatedByString:@"-"];
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *components = [[NSDateComponents alloc] init];
    components.year = [dates[0] integerValue];
    components.month = [dates[1] integerValue];
    components.day = 1;
    
    // 星期
    NSDate *date = [calendar dateFromComponents:components];
    NSDateComponents *componets = [[NSCalendar autoupdatingCurrentCalendar] components:NSCalendarUnitWeekday fromDate:date];
    NSInteger day = [componets weekday] - 1;
    day = day == 7 ? 0 : day;
    
    // 天数
    NSRange range = [calendar rangeOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitMonth forDate:date];
    NSUInteger numberDay = range.length;
    
    UIView *bgView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 0)];
    bgView.backgroundColor = [UIColor whiteColor];
    
    // 当前日期
    UILabel *dateLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, 0, ScreenWidth, 45)];
    dateLabel.text = currentDate;
    dateLabel.font = [UIFont boldSystemFontOfSize:14];
    dateLabel.textColor = kMainTextColor;
    [bgView addSubview:dateLabel];
    
    float y = dateLabel.maxY;
    float x = 15;
    float width = (ScreenWidth - 30) / 7;
    NSArray *weeks = @[@"日", @"一", @"二", @"三", @"四", @"五", @"六"];
    for (int i = 0; i < weeks.count; i++) {
        
        UILabel *weekLabel = [[UILabel alloc] initWithFrame:CGRectMake(15 + i * width, y, width, width)];
        weekLabel.text = weeks[i];
        weekLabel.font = [UIFont systemFontOfSize:14];
        weekLabel.textColor = [UIColor colorWithHexString:@"0x666666"];
        weekLabel.textAlignment = NSTextAlignmentCenter;
        [bgView addSubview:weekLabel];
    }
    
    for (NSInteger i = day; i < numberDay + day; i++) {
        
        x = 15 + i % 7 * width;
        y = (dateLabel.maxY + width) + i / 7 * width;
        
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(x, y, width, width);
        button.titleLabel.font = [UIFont systemFontOfSize:14];
        [button setTitle:[NSString stringWithFormat:@"%zd", i - day + 1] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor colorWithHexString:@"0x666666"] forState:UIControlStateNormal];
        [bgView addSubview:button];
        
        bgView.height = button.maxY + 15;
    }
    
    return bgView;
}

@end

