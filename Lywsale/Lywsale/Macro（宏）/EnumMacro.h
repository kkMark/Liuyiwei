//
//  EnumMacro.h
//  Lywsale
//
//  Created by M on 2018/8/18.
//  Copyright © 2018年 黄锡凯. All rights reserved.
//

#ifndef EnumMacro_h
#define EnumMacro_h

/// 注册用户类型
typedef enum : NSUInteger {
    
    /// 药店
    PharmacyType = 0,
    /// 连锁店
    ChainType,
    /// 药厂
    PharmaceuticalType,
    
} RegisteredUserType;

#endif /* EnumMacro_h */
