//
//  LTAccount+Init.h
//  YouPai
//
//  Created by stonedong on 15/10/19.
//  Copyright © 2015年 stonedong. All rights reserved.
//

#import "LTAccount.h"

@class YPUserLoginRsq;
@interface LTAccount (Init)
- (instancetype) initWithLoginData:(YPUserLoginRsq*)rsp;
@end
