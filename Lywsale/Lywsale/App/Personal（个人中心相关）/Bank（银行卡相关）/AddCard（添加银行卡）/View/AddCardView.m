//
//  AddCardView.m
//  Lywsale
//
//  Created by 黄锡凯 on 2018/10/20.
//  Copyright © 2018 黄锡凯. All rights reserved.
//

#import "AddCardView.h"
#import "SelectListView.h"

@interface AddCardView ()

@property (nonatomic, copy) NSArray *detailTexts;
@property (nonatomic, strong) UITextField *numberTextField;

@end

@implementation AddCardView
@synthesize numberTextField;

#pragma mark - lazy
- (UITextField *)numberTextField {

    if (!numberTextField) {
        
        numberTextField = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth / 2, 45)];
        numberTextField.placeholder = self.detailTexts[3];
        numberTextField.font = [UIFont systemFontOfSize:14];
        numberTextField.textAlignment = NSTextAlignmentRight;
        numberTextField.keyboardType = UIKeyboardTypeNumberPad;
    }
    
    return numberTextField;
}

#pragma mark - tableview
- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style {
    
    if (self = [super initWithFrame:frame style:style]) {
        
        self.detailTexts = @[GetUserDefault(UserName),
                             @"请选择对应的银行",
                             @"请选择对应银行支行",
                             @"请填写银行卡号"];
    }
    
    return self;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if (cell == nil) {
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"Cell"];
    }

    NSInteger row = indexPath.row;
    NSArray *titles = @[@"银行", @"支行"];
    NSString *text = self.dataSources[row];
    NSString *detailText = self.detailTexts[row];
    
    cell.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0);
    cell.textLabel.text = text;
    cell.textLabel.font = [UIFont systemFontOfSize:14];
    cell.textLabel.textColor = [UIColor colorWithHexString:@"0x666666"];

    for (int i = 0; i < titles.count; i++) {
        
        if ([text isEqualToString:titles[i]]) {
            
            UIImageView *moreImgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 17, 17)];
            moreImgView.image = [UIImage imageNamed:@"more"];
            cell.accessoryView = moreImgView;
        }
    }
    
    if (![detailText isEqualToString:@"请填写银行卡号"]) {
        
        cell.detailTextLabel.textColor = [UIColor colorWithHexString:@"0x999999"];
        cell.detailTextLabel.font = [UIFont systemFontOfSize:14];
        cell.detailTextLabel.text = detailText;
        
        if (![self.detailTexts containsObject:cell.detailTextLabel.text]) {
            
            if (indexPath.row != 0) {
                cell.detailTextLabel.textColor = kMainTextColor;
            }
        }
    }
    else cell.accessoryView = self.numberTextField;

    if ([text isEqualToString:@"持卡人"] || [text isEqualToString:@"卡号"]) {
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [super tableView:tableView didSelectRowAtIndexPath:indexPath];
    [self endEditing:YES];
    
    NSString *text = self.dataSources[indexPath.row];
    if (indexPath.row > 0) {
        
        if ([text isEqualToString:@"卡号"]) {
            [self.numberTextField becomeFirstResponder];
        }
        else {
            
            if ([text isEqualToString:@"银行"]) {
                
            }
            else if ([text isEqualToString:@"支行"]) {
                
            }
            
            SelectListView *selectListView = [[SelectListView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight) title:text];
            [[UIApplication sharedApplication].keyWindow addSubview:selectListView];
        }
    }
}

@end
