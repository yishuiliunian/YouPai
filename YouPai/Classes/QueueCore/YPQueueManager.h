//
//  YPQueueManager.h
//  YouPai
//
//  Created by stonedong on 15/9/7.
//  Copyright (c) 2015年 stonedong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YPQueueModel.h"

#define YPCurrentQueue [YPQueueManager shareManager].currentQueue

@interface YPQueueManager : NSObject
+ (YPQueueManager*) shareManager;
@property (nonatomic, strong, readonly) YPQueueModel* currentQueue;
@end
