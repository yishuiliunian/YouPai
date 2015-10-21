//
//  YPHistoryDataSync.m
//  YouPai
//
//  Created by stonedong on 15/10/21.
//  Copyright © 2015年 stonedong. All rights reserved.
//

#import "YPHistoryDataSync.h"
#import "YPHistoryReq.h"
#import "LTAccountManager.h"
@implementation YPHistoryDataSync
- (MSRequest*) request
{
    YPHistoryReq* req = [YPHistoryReq new];
    
    req.userId = LTCurrentAccount.userID;
    req.status = 2;
    
    return req;
}
@end
