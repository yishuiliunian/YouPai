//
//  YPSearchDataSync.m
//  YouPai
//
//  Created by stonedong on 15/9/12.
//  Copyright (c) 2015年 stonedong. All rights reserved.
//

#import "YPSearchDataSync.h"
#import "DZNormalLayout.h"
#import "YPFindSPReq.h"
#import "YPLocationManager.h"
#import "MUAlertPool.h"

@interface YPSearchDataSync () <MSRequestUIDelegate>

@end


@implementation YPSearchDataSync

- (void) searchWithKeyword:(NSString *)keyword
{
    YPFindSPReq* findReq = [YPFindSPReq new];
    findReq.lat = YPCurrentLocation.latitude;
    findReq.lng = YPCurrentLocation.longtitude;
    MSPerformRequestWithDelegateSelf(findReq);
}

- (void) request:(MSRequest *)request onSucced:(id)object
{
    [self finishedReloadAllData:object];
}

- (void) request:(MSRequest *)request onError:(NSError *)error
{
    MUAlertShowError(error.localizedDescription);
}
@end
