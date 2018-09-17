//
//  UserDefaultsMacro.h
//  DingBell
//
//  Created by M on 2018/4/8.
//  Copyright © 2018年 黄锡凯. All rights reserved.
//

#ifndef UserDefaultsMacro_h
#define UserDefaultsMacro_h

// 用户昵称
#define UserName    @"userName"
// 用户ID
#define UserID      @"userId"

#endif /* UserDefaultsMacro_h */


//---------------------- Debug模式下打印日志和当前行数 ----------------------
#if DEBUG
#define DebugLog(FORMAT, ...) fprintf(stderr,"╭═════════════════════════════════════════════════════════╮ \n║方法:%s 行:%d \n║详情:%s\n", __FUNCTION__, __LINE__, [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String]);
#else
#define DebugLog(FORMAT, ...) nil
#endif
