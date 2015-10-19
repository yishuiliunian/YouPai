//
//  YPMineViewController.m
//  YouPai
//
//  Created by stonedong on 15/9/7.
//  Copyright (c) 2015年 stonedong. All rights reserved.
//

#import "YPMineViewController.h"
#import "YPMineHeaderView.h"
#import "YPMiniDataSync.h"
#import "YPSettingsViewController.h"
#import "LTAccountManager.h"
#import "LKHaneke.h"
#import "LTGlobals.h"
@interface YPMineViewController ()
@property (nonatomic, strong, readonly) YPMineHeaderView* headerView;
@property (nonatomic, strong, readonly) YPMiniDataSync* mineDataSyncer;
@end

@implementation YPMineViewController
- (instancetype) initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithSyncer:[YPMiniDataSync new]];
    if (!self) {
        return self;
    }
    return nil;
}
- (YPMiniDataSync *)mineDataSyncer
{
    return (YPMiniDataSync*) self.dataSyncer;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    _headerView = [YPMineHeaderView new];
    self.tableView.tableHeaderView = _headerView;
    _headerView.adjustHeight = 200;
    //
    [_headerView.settingButton addTarget:self action:@selector(loadSettings) forControlEvents:UIControlEventTouchUpInside];
    //
    [self reloadData];
}



- (void) reloadData
{
    [self.dataSyncer reloadData];
    
    LTUserInfo* userInfo = LTCurrentAccount.userInfo;
    [_headerView.headImageView loadAvatarURL:ENSURE_URL(userInfo.avatarURL)];
    if (userInfo.nickName) {
        _headerView.nickLabel.text = userInfo.nickName;
    } else {
        _headerView.nickLabel.text = @"未名";
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


- (void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
}

- (void) viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    self.navigationController.navigationBarHidden = NO;
}

#pragma Settings

- (void) loadSettings
{
    YPSettingsViewController* vc = [[YPSettingsViewController alloc] initWithNibName:nil  bundle:nil];
    [self.navigationController pushViewController:vc animated:YES];
}

@end

