//
//  UserDefaultsMacro.h
//  DingBell
//
//  Created by M on 2018/4/8.
//  Copyright © 2018年 黄锡凯. All rights reserved.
//

#ifndef UserDefaultsMacro_h
#define UserDefaultsMacro_h

// 用户账号
#define Account         @"userAccount"
// 用户昵称
#define UserName        @"userName"
// 用户ID
#define UserID          @"userId"
// 用户类型 0 - 店员， 1 - 店长
#define UserType        @"userType"
// 门店id
#define ShoporgId       @"shoporgId"
// 连锁机构id
#define OrgId           @"orgId"
// token类型
#define Token_Type      @"token_type"
// 访问token
#define Access_Token    @"access_token"
// 刷新token
#define Refresh_Token   @"refresh_token"

#endif /* UserDefaultsMacro_h */


//---------------------- Debug模式下打印日志和当前行数 ----------------------
#if DEBUG
#define DebugLog(FORMAT, ...) fprintf(stderr,"╭═════════════════════════════════════════════════════════╮ \n║方法:%s 行:%d \n║详情:%s\n", __FUNCTION__, __LINE__, [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String]);
#else
#define DebugLog(FORMAT, ...) nil
#endif
