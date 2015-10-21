//
//  YPServiceDetailViewController.m
//  YouPai
//
//  Created by stonedong on 15/9/9.
//  Copyright (c) 2015年 stonedong. All rights reserved.
//

#import "YPServiceDetailViewController.h"
#import "YPOperationTableViewCell.h"
#import "YPServiceDetailHeaderView.h"
#import "LKHaneke.h"
#import "YPServiceDetail.h"
#import "LTGlobals.h"
#import "UIViewController+Additions.h"
#import <CoreText/CoreText.h>
#import "YPAddAttrackReq.h"
#import "YPCancelAttrackReq.h"
@interface YPServiceDetailViewController () <MSRequestUIDelegate>
DEFINE_PROPERTY_STRONG(YPServiceDetailHeaderView*, headerView);
@property (nonatomic, strong) YPServiceDetail* serviceDetail;
@end

@implementation YPServiceDetailViewController

- (void) setService:(YPService *)service
{
    if (_service != service) {
        _service = service;
        _serviceDetail = [YPServiceDetail new];
        _serviceDetail.watched = _service.watching;
        _serviceDetail.name = _service.name;
    }

}
- (void)viewDidLoad {
    [super viewDidLoad];
    _headerView = [YPServiceDetailHeaderView new];
    self.tableView.tableHeaderView = _headerView;
    
    
    YPServiceDetail* detail = [YPServiceDetail new];
    detail.imageURLs = @[[NSURL URLWithString:@"https://www.baidu.com/img/bdlogo.png"]];
    detail.address = @"北京市西直门外大街";
    detail.phoneNumber = @"xxxxxxxx";
    detail.name = @"朝阳营业厅";
    
    
    NSMutableArray* array = [NSMutableArray new];
    for (int i = 0; i < 3; i++) {
        YPBusiniess* b = [YPBusiniess new];
        b.identifier = ENSURE_STR(@(3));
        b.title = ENSURE_STR(@(3));
        b.detail = @"sdfahjskdfhakjsdfhaksjdfh";
        [array addObject:b];
    }
    
    detail.businiesses = array;

    
    self.serviceDetail = detail;
#if DEBUG
   
    
#endif
}
- (void) setServiceDetail:(YPServiceDetail *)serviceDetail
{
    if (_serviceDetail != serviceDetail) {
        _serviceDetail = serviceDetail;
        [self updateUIDisplay];
    }

}
- (void) reloadData
{
    
}

- (void) updateUIDisplay
{
    self.title = _serviceDetail.name;
    [_headerView.imageView loadFeedBackgroundURL:ENSURE_URL(_serviceDetail.imageURLs.firstObject) ];
    _headerView.addressLabel.text = _serviceDetail.address;
    _headerView.phoneLabel.text = _serviceDetail.phoneNumber;
    
    
    NSDictionary* textAttribute = @{
                                    NSForegroundColorAttributeName:[UIColor whiteColor]
                                    };
    if (!_serviceDetail.watched) {
        UIBarButtonItem* item = [[UIBarButtonItem alloc] initWithTitle:@"关注" style:UIBarButtonItemStyleDone target:self action:@selector(actionWatchThisService)];
        [item setTitleTextAttributes:textAttribute forState:UIControlStateNormal];
    
        self.navigationItem.rightBarButtonItem = item;
    } else {
        UIBarButtonItem* item = [[UIBarButtonItem alloc] initWithTitle:@"取消关注" style:UIBarButtonItemStyleDone target:self action:@selector(actionUnWatch)];
        [item setTitleTextAttributes:textAttribute forState:UIControlStateNormal];
        self.navigationItem.rightBarButtonItem = item;
    }
    
    [self.tableView reloadData];

}

- (void) actionWatchThisService
{
    YPAddAttrackReq* addReq = [YPAddAttrackReq new];
    addReq.userId = LTCurrentAccount.userID;
    addReq.spId = self.service.identifier;
    MSPerformRequestWithDelegateSelf(addReq);
}

- (void) actionUnWatch
{
    YPCancelAttrackReq* cancelReq = [YPCancelAttrackReq new];
    cancelReq.userId = LTCurrentAccount.userID;
    cancelReq.spId = self.service.identifier;
    MSPerformRequestWithDelegateSelf(cancelReq);
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _serviceDetail.businiesses.count;
}


- (UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString* identifier = @"cell";
    YPOperationTableViewCell* cell = [self.tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[YPOperationTableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:identifier];
    }
    YPBusiniess* businiess = [_serviceDetail.businiesses objectAtIndex:indexPath.row];
    cell.businiess = businiess;
    return cell;
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}


- (void) request:(MSRequest *)request onError:(NSError *)error
{
    
}

- (void) request:(MSRequest *)request onSucced:(id)object
{
    if ([request isKindOfClass:[YPAddAttrackReq class]]) {
        MUAlertHUDSuccess(@"关注成功");
        _serviceDetail.watched = YES;
        [self updateUIDisplay];
    } else if ([request isKindOfClass:[YPCancelAttrackReq class]]) {
        MUAlertHUDSuccess(@"取消关注成功");
        _serviceDetail.watched = NO;
        [self updateUIDisplay];
    }
}

@end
