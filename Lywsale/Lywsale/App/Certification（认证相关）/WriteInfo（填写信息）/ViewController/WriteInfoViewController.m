//
//  WriteInfoViewController.m
//  Lywsale
//
//  Created by M on 2018/8/19.
//  Copyright © 2018年 黄锡凯. All rights reserved.
//

#import "WriteInfoViewController.h"
#import "WriteInfoView.h"

@interface WriteInfoViewController ()

@property (nonatomic, strong) WriteInfoView *writeInfoView;


@end

@implementation WriteInfoViewController
@synthesize writeInfoView;

- (void)viewDidLoad {

    [super viewDidLoad];

    
}


#pragma mark - lazy
- (WriteInfoView *)writeInfoView {
    
    if (!writeInfoView) {
        
        writeInfoView = [[WriteInfoView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight - self.navHeight) style:UITableViewStylePlain];
        writeInfoView.backgroundColor = [UIColor whiteColor];
        [self.view addSubview:writeInfoView];
    }
    
    return writeInfoView;
}

@end
