//
//  YPServiceViewController.m
//  YouPai
//
//  Created by stonedong on 15/9/7.
//  Copyright (c) 2015年 stonedong. All rights reserved.
//

#import "YPServiceViewController.h"
#import "YPServiceDataSync.h"
#import "YPServiceDetailViewController.h"
#import "UIViewController+Additions.h"
#import "YPSearchServiceViewController.h"
#import "DZNormalLayout.h"
#import "YPService.h"
@interface YPServiceViewController ()
@property (nonatomic, strong, readonly) YPServiceDataSync* serviceDataSync;
@end

@implementation YPServiceViewController
- (instancetype) initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithSyncer:[YPServiceDataSync new]];
    if (!self) {
        return self;
    }
    return nil;
}
- (YPServiceDataSync*) serviceDataSync
{
    return (YPServiceDataSync*) self.dataSyncer;
}

- (void) customViewController
{
    UIBarButtonItem* item = [self customBarButtonItemWithTarget:self selector:@selector(addService) image:@"top_add" highlightImage:@"top_add"];
    self.navigationItem.rightBarButtonItem = item;
}

- (void) addService
{
    YPSearchServiceViewController* vc = [YPSearchServiceViewController new];
    [self.navigationController pushViewController:vc animated:YES];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"服务";
    [self.dataSyncer reloadData];
    [self customViewController];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    DZNormalLayout* layout = (DZNormalLayout*)[self.dataSyncer layoutAtIndex:indexPath.row];
    YPService* service = (YPService*) layout.dataObject;
    YPServiceDetailViewController* detailVC = [YPServiceDetailViewController new];
    detailVC.service = service;
    [self.navigationController pushViewController:detailVC animated:YES];
}
@end
