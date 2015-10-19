//
//  YPSearchDataSync.h
//  YouPai
//
//  Created by stonedong on 15/9/12.
//  Copyright (c) 2015年 stonedong. All rights reserved.
//

#import "DZTableDataSync.h"

@interface YPSearchDataSync : DZTableDataSync
- (void) searchWithKeyword:(NSString*)keyword;
@end
