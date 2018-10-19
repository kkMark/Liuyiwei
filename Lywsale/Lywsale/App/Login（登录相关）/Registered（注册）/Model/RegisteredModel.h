//
//  RegisteredModel.h
//  Lywsale
//
//  Created by 黄锡凯 on 2018/10/15.
//  Copyright © 2018 黄锡凯. All rights reserved.
//

#import "BaseModel.h"

@interface RegisteredModel : BaseModel

/// 会员名称
@property (nonatomic, copy) NSString *memberName;
/// 性别 1.男 2.女
@property (nonatomic, copy) NSString *sex;
/// 生日 格式 yyyy-mm-dd
@property (nonatomic, copy) NSString *birthday;
/// 手机号
@property (nonatomic, copy) NSString *memberMob;
/// 密码
@property (nonatomic, copy) NSString *memberPass;
/// 注册渠道
@property (nonatomic, copy) NSString *registerChannel;
@property (nonatomic, copy) NSString *openid;
/// 验证码
@property (nonatomic, copy) NSString *code;
/// 绑定机构
@property (nonatomic, copy) NSString *orgCode;
/// 绑定门店
@property (nonatomic, copy) NSString *shoporgCode;

@end
