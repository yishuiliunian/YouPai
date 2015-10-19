//
//  YPSearchDataSync.m
//  YouPai
//
//  Created by stonedong on 15/9/12.
//  Copyright (c) 2015年 stonedong. All rights reserved.
//

#import "YPSearchDataSync.h"
#import "DZNormalLayout.h"
@implementation YPSearchDataSync

- (void) searchWithKeyword:(NSString *)keyword
{
    NSMutableArray* array = [NSMutableArray new];
    for (int i = 0; i < 10; i++) {
        DZNormalLayout* layout = [DZNormalLayout new];
        layout.title = @"北京市西城区地税厅";
        layout.content = @"北京市西城区西直门外大街44号";
        layout.imageURL = @"http://10086.cn/bj_tail/images/knetSealLogo.png";
        [array addObject:layout];
    }
    [self finishedReloadAllData:array];
}
@end
