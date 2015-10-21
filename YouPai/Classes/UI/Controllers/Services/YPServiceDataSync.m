//
//  YPServiceDataSync.m
//  YouPai
//
//  Created by stonedong on 15/9/7.
//  Copyright (c) 2015年 stonedong. All rights reserved.
//

#import "YPServiceDataSync.h"
#import "DZNormalLayout.h"
#import "YPService.h"
#import "YPRealmManager.h"
#import "YPAttrackSPReq.h"
#import "LTAccountManager.h"
#import "LTNotificationTools.h"
@interface YPServiceDataSync () <MSRequestUIDelegate>

@end


@implementation YPServiceDataSync

- (void) dealloc
{
    LTRemoveObserverForAttrackServiceChanged(self);
}
- (instancetype) init
{
    self = [super init];
    if (!self) {
        return self;
    }
    LTAddObserverForAccountLoad(self, @selector(reloadData));
    return self;

}
- (void) reloadData
{
    YPAttrackSPReq* req = [YPAttrackSPReq new];
    req.userId = LTCurrentAccount.userID;
    [MSDefaultSyncCenter performRequest:req withUIDelegate:self];
}

- (void) request:(MSRequest *)request onError:(NSError *)error
{
    
}

- (void) request:(MSRequest *)request onSucced:(id)object
{
    [self finishedReloadAllData:object];
}
@end
