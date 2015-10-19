//
//  YPQueueDataSync.m
//  YouPai
//
//  Created by stonedong on 15/9/7.
//  Copyright (c) 2015年 stonedong. All rights reserved.
//

#import "YPQueueDataSync.h"
#import "DZNormalLayout.h"
@implementation YPQueueDataSync
- (void) reloadData
{
    [self startSync];
    
    NSMutableArray* array = [NSMutableArray new];
    
    DZNormalLayout* l1 = [DZNormalLayout new];
    l1.title = @"xxx";
    l1.content = @"xxdafsdfasdf";
    l1.imageURL = @"http://www.risecenter.com/images/index/pic_roll1.jpg";
    [array addObject:l1];
    
    [self finishedReloadAllData:array];
}
@end
