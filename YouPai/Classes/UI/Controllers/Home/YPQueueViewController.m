//
//  YPQueueViewController.m
//  YouPai
//
//  Created by stonedong on 15/9/7.
//  Copyright (c) 2015年 stonedong. All rights reserved.
//

#import "YPQueueViewController.h"
#import "YPQueueHeaderView.h"
#import "YPUnQueueHeaderView.h"
#import "YPQueueDataSync.h"
#import <DZProgramDefines.h>
#import "YPService.h"
#import "LTNotificationTools.h"
#import "YPSearchServiceViewController.h"
#import "YPQueueManager.h"
@interface YPQueueViewController ()
{
    NSTimer* _monitorTimer;
}
DEFINE_PROPERTY_STRONG_READONLY(YPQueueHeaderView*, queueHeaderView);
DEFINE_PROPERTY_STRONG_READONLY(YPUnQueueHeaderView*, unQuqueHeaderView);
DEFINE_PROPERTY_STRONG_READONLY(YPQueueDataSync*, ququeDataSync);
@end


@implementation YPQueueViewController

- (void) dealloc
{
    LTRemoveObserverForQueueStateChanged(self);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    LTAddObserverForTabBarOrderSelectIndex(self, @selector(reloadHeaderView));
    _queueHeaderView= [YPQueueHeaderView new];
    //
    _unQuqueHeaderView = [YPUnQueueHeaderView new];
    [_unQuqueHeaderView.queueButton addTarget:self action:@selector(startAnyQueue) forControlEvents:UIControlEventTouchUpInside];
    //
    [self reloadHeaderView];
    
    [self.dataSyncer reloadData];
    self.title = @"优排";
}

- (YPQueueDataSync*) ququeDataSync
{
    return (YPQueueDataSync*)self.dataSyncer;
}

- (void) startAnyQueue
{
    if ([YPService watchedService].count) {
        LTPostTabBarOrderSelectIndex(@{@"index":@(1)});
    } else {
        YPSearchServiceViewController* searchVC = [YPSearchServiceViewController new];
        [self.navigationController pushViewController:searchVC animated:YES];
    }
}

- (void) reloadHeaderView
{
    if ([YPQueueManager shareManager].currentQueue) {
        self.tableView.tableHeaderView = _queueHeaderView;
        _queueHeaderView.adjustHeight = 150;
        _queueHeaderView.count = 2222;
        _queueHeaderView.time = 22;
    } else {
        self.tableView.tableHeaderView = _unQuqueHeaderView;
        _unQuqueHeaderView.adjustHeight = 150;
        
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}



@end
