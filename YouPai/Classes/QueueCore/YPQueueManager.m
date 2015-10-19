//
//  YPQueueManager.m
//  YouPai
//
//  Created by stonedong on 15/9/7.
//  Copyright (c) 2015年 stonedong. All rights reserved.
//

#import "YPQueueManager.h"
#import <DZSingletonFactory.h>

@interface YPQueueManager ()
{
    NSTimer* _monitorTimer;
}
@end


@implementation YPQueueManager
+ (YPQueueManager*) shareManager
{
    return DZSingleForClass([self class]);
}

- (instancetype) init
{
    self = [super init];
    if (!self) {
        return self;
    }
    if (self.currentQueue) {
        [self startMonitor];
    }
    _currentQueue = [YPQueueModel new];
    return self;
}


- (void) startMonitor
{
    [self stopMonitor];
    _monitorTimer = [NSTimer scheduledTimerWithTimeInterval:5 target:self selector:@selector(checkQueueState) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:_monitorTimer forMode:NSDefaultRunLoopMode];
    [_monitorTimer fire];
}

- (void) checkQueueState
{
    
}
- (void) stopMonitor
{
    [_monitorTimer invalidate];
    _monitorTimer = nil;
}

@end
