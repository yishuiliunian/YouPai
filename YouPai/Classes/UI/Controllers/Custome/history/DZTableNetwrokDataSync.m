//
//  DZTableNetwrokDataSync.m
//  YouPai
//
//  Created by stonedong on 15/10/21.
//  Copyright © 2015年 stonedong. All rights reserved.
//

#import "DZTableNetwrokDataSync.h"
#import "MUAlertPool.h"
@implementation DZTableNetwrokDataSync
- (void) reloadData
{
    MSRequest* request = [self request];
    MSPerformRequestWithDelegateSelf(request);
}

- (void) request:(MSRequest *)request onError:(NSError *)error
{
    MUAlertShowError(error.localizedDescription);
}

- (void) request:(MSRequest *)request onSucced:(id)object
{
    [self finishedReloadAllData:object];
}
@end
