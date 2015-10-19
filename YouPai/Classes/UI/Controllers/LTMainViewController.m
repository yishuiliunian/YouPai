//
//  LTMainViewController.m
//  LuTu
//
//  Created by stonedong on 15/4/6.
//  Copyright (c) 2015年 Road.Inc. All rights reserved.
//

#import "LTMainViewController.h"
#import "LTNotificationTools.h"
@implementation LTMainViewController
- (instancetype) initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (!self) {
        return self;
    }
    LTAddObserverForTabBarOrderSelectIndex(self, @selector(orderSelectTabIndex:));
    return self;

}

- (void) orderSelectTabIndex:(NSNotification*)nc
{
    NSDictionary* userInfo = [nc userInfo];
    if (!userInfo) {
        return;
    }
    
    NSInteger index = [userInfo[@"index"] integerValue];
    
    if (index >= self.viewControllers.count) {
        return;
    }
    [self setSelectedIndex:index];
}
@end
