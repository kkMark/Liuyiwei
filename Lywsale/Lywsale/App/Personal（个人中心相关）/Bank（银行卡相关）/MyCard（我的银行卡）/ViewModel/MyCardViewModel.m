//
//  MyCardViewModel.m
//  GanLuXiangBan
//
//  Created by M on 2018/6/2.
//  Copyright © 2018年 黄锡凯. All rights reserved.
//

#import "MyCardViewModel.h"


@implementation MyCardViewModel

- (void)getAllBankComplete:(void (^)(id))complete {
    
    self.urlString = [self getRequestUrl:@[@"MasterData", @"banklist"]];
}

- (void)getUserBankListComplete:(void (^)(id))complete {
    
    self.urlString = [self getRequestUrl:@[@"Doctor", @"Banklist"]];
}

- (void)deleteBankWithIds:(NSArray *)ids complete:(void (^)(id object))complete {

    NSString *str = [ids componentsJoinedByString:@","];
    
    self.urlString = [self getRequestUrl:@[@"Doctor", @"DelBank"]];
    self.parameters = str;
}

- (void)addBankWithCardperson:(NSString *)cardperson
                         bank:(NSString *)bank
                   cardNumber:(NSString *)cardNumber
                     complete:(void (^)(id object))complete
{
    self.urlString = [self getRequestUrl:@[@"Doctor", @"AddBank"]];
    self.parameters = @{ @"card_person" : cardperson,
                         @"bank" : bank,
                         @"card_no" : cardNumber };
}

- (void)setDefaultWithId:(NSString *)idString Complete:(void (^)(id))complete {
    
    self.urlString = [self getRequestUrl:@[@"Doctor", @"SetDefault"]];
    self.parameters = idString;
}

@end
