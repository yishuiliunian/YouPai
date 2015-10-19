//
//  YPSearchServiceViewController.m
//  YouPai
//
//  Created by stonedong on 15/9/12.
//  Copyright (c) 2015年 stonedong. All rights reserved.
//

#import "YPSearchServiceViewController.h"
#import "YPSearchDataSync.h"
#import "YPServiceDetailViewController.h"
@interface YPSearchServiceViewController () <UISearchBarDelegate>
@property (nonatomic, strong) YPSearchDataSync* searchDataSync;
@property (nonatomic, strong) UISearchBar* searchBar;
@end

@implementation YPSearchServiceViewController

- (instancetype) initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithSyncer:[YPSearchDataSync new]];
    if (!self) {
        return self;
    }
    return self;
}
- (YPSearchDataSync*) searchDataSync
{
    return (YPSearchDataSync*)self.dataSyncer;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"搜索";
    _searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.frame), 44)];
    _searchBar.delegate =self;
    self.tableView.tableHeaderView = _searchBar;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma searchbar

- (void) searchBarTextDidBeginEditing:(UISearchBar *)searchBar
{
    _searchBar.showsCancelButton = YES;
}

- (void) searchBarTextDidEndEditing:(UISearchBar *)searchBar
{
    _searchBar.showsCancelButton = NO;
}


- (void) searchBarCancelButtonClicked:(UISearchBar *)searchBar
{
    [searchBar resignFirstResponder];
}

- (void) searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    [searchBar resignFirstResponder];
    [self.searchDataSync searchWithKeyword:searchBar.text];
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    YPServiceDetailViewController* detailVC = [YPServiceDetailViewController new];
    [self.navigationController pushViewController:detailVC animated:YES];
}
@end
