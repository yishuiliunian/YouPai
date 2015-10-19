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
@implementation YPServiceDataSync

- (void) reloadData
{
    
    
    YPService* service = [YPService new];
    service.identifier = @"xsdfsdf";
    service.name = @"朝阳地税厅";
    service.addressName = @"西城区朝阳北路22号";
    service.headerURL = @"https://avatars0.githubusercontent.com/u/846525?v=3&s=96";
    service.watching = YES;
    
    YPRealmCreateOrUpdateObject(@[service]);
    
    NSMutableArray* array = [NSMutableArray new];
    for (YPService* s  in [YPService watchedService]) {
        DZNormalLayout* layout = [DZNormalLayout new];
        layout.title = s.name;
        layout.content = s.addressName;
        layout.imageURL = s.headerURL;
        [array addObject:layout];
    }
    
    [self finishedReloadAllData:array];
}
@end
