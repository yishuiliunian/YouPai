//
//  YPSettingsViewController.m
//  YouPai
//
//  Created by stonedong on 15/9/9.
//  Copyright (c) 2015年 stonedong. All rights reserved.
//

#import "YPSettingsViewController.h"
#import "YPActionLayout.h"
#import <DZProgramDefines.h>
#import <DZImageCache.h>
@interface YPSettingsViewController ()
{
    NSArray* _actionsArray;
}
@end
INIT_DZ_EXTERN_STRING(kSettingComment, 评价);
INIT_DZ_EXTERN_STRING(kSettingAdvice, 意见反馈)
INIT_DZ_EXTERN_STRING(kSettingAbout, 关于我们)
@implementation YPSettingsViewController

- (void) viewDidLoad
{
    [super viewDidLoad];
    
    YPActionLayout* comentAction = [[YPActionLayout alloc] initWithImage:DZCachedImageByName(@"评价")    title:kSettingComment];
    YPActionLayout* adviceAction = [[YPActionLayout alloc] initWithImage:DZCachedImageByName(@"意见反馈") title:kSettingAdvice];
    YPActionLayout* aboutAction = [[YPActionLayout alloc] initWithImage:DZCachedImageByName(@"关于我们") title:kSettingAbout];
    
    _actionsArray = @[comentAction, adviceAction, aboutAction];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _actionsArray.count;
}

- (UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    DZLayout* layout = [_actionsArray objectAtIndex:indexPath.row];
    DZLayoutTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:layout.cellIdentify];
    if (!cell) {
        cell = [layout cell];
    }
    cell.layout = layout;
    return cell;
}
@end
