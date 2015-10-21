//
//  LTAccount+Init.m
//  YouPai
//
//  Created by stonedong on 15/10/19.
//  Copyright © 2015年 stonedong. All rights reserved.
//

#import "LTAccount+Init.h"
#import "YPUserLoginRsq.h"
#import <DZProgramDefines.h>
#import "YPUserInfo.h"
@implementation LTAccount (Init)
- (instancetype) initWithLoginData:(YPUserLoginRsq*)rsp
{
    self = [super init];
    if (!self) {
        return self;
    }
    self.userID = DZ_NUM_2_STR(rsp.userId);
    self.token = rsp.token;
    
    YPUserInfo* userInfo = [YPUserInfo new];
    userInfo.email = rsp.email;
    userInfo.phone = rsp.mobile;
    userInfo.nickName = rsp.uname;
    userInfo.avatarURL = @"";
    userInfo.accountType = rsp.accountType;
    return self;
}
@end
