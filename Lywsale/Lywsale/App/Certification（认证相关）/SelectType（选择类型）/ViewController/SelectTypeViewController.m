//
//  SelectTypeViewController.m
//  Lywsale
//
//  Created by M on 2018/8/19.
//  Copyright © 2018年 黄锡凯. All rights reserved.
//

#import "SelectTypeViewController.h"
#import "SelectTypeView.h"
#import "SearchView.h"
#import "SelectTypeModel.h"

@interface SelectTypeViewController ()

@property (nonatomic, strong) SelectTypeView *selectTypeView;
@property (nonatomic, strong) SearchView *searchView;
@property (nonatomic, strong) NSDictionary *dataSource;

@end

@implementation SelectTypeViewController
@synthesize selectTypeView;
@synthesize searchView;

- (void)viewDidLoad {

    [super viewDidLoad];

    NSDictionary *dict = @{@"A" : @[@"", @"", @""],
                           @"B" : @[@"", @"", @""]};
    
    self.selectTypeView.dictDataSource = dict;
}


#pragma mark - lazy
- (SelectTypeView *)selectTypeView {
    
    if (!selectTypeView) {
        
        selectTypeView = [[SelectTypeView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.searchView.frame), ScreenWidth, (ScreenHeight - self.navHeight - self.searchView.height)) style:UITableViewStyleGrouped];
        selectTypeView.userType = self.userType;
        [self.view addSubview:selectTypeView];
        
        @weakify(self);
        [self.selectTypeView setGoViewController:^(UIViewController *vc) {
            
            @strongify(self);
            [self.navigationController pushViewController:vc animated:YES];
        }];
    }
    
    return selectTypeView;
}

- (SearchView *)searchView {
    
    if (!searchView) {
        
        searchView = [[SearchView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 55)];
        searchView.textField.placeholder = @"请输入要查找的店面";
        [self.view addSubview:searchView];
        
        @weakify(self);
        [self.searchView setSearchBlock:^(NSString *searchTextString) {
           
            @strongify(self);
            if (searchTextString.length > 0) {
                
                NSDictionary *tempDict = self.dataSource;
                NSArray *keys = [tempDict allKeys];
                NSMutableArray *searchArray = [NSMutableArray array];
                for (int i = 0; i < keys.count; i++) {
                    
                    for (SelectTypeModel *model in [tempDict objectForKey:keys[i]]) {
                        
                    }
                }
                
                if (searchArray.count == 0) {
                    
                    NSDictionary *dict = @{@"" : @[@""]};
                    self.selectTypeView.dictDataSource = dict;
                }
                else {
                    
                    NSDictionary *dict = @{@"" : searchArray};
                    self.selectTypeView.dictDataSource = dict;
                }
            }
            else {
                
                self.selectTypeView.dictDataSource = self.dataSource;
            }
        }];
    }
    
    return searchView;
}

@end
