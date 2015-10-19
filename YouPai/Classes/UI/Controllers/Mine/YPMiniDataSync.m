//
//  YPMiniDataSync.m
//  YouPai
//
//  Created by stonedong on 15/9/7.
//  Copyright (c) 2015年 stonedong. All rights reserved.
//

#import "YPMiniDataSync.h"
#import "YPActionLayout.h"
#import <DZImageCache.h>
@implementation YPMiniDataSync
- (void) reloadData
{
    NSMutableArray* array = [NSMutableArray new];
        YPActionLayout* layout = [YPActionLayout new];
        layout.title = @"历史排队";
        layout.image = DZCachedImageByName(@"历史排队");
        [array addObject:layout];
    [self finishedReloadAllData:array];
}
@end
