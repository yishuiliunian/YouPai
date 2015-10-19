//
//  LTGlobalViewController.m
//  LuTu
//
//  Created by stonedong on 15/4/6.
//  Copyright (c) 2015年 Road.Inc. All rights reserved.
//

#import "LTGlobalViewController.h"
#import "LTMainViewController.h"
#import "LTNavigationController.h"
#import "LTGuideContainerViewController.h"
#import <DZImageCache.h>
#import "LTAccountManager.h"
#import "LTPhoneRegisterViewController.h"
#import "LTAuthViewController.h"
#import "YPQueueViewController.h"
#import "YPMineViewController.h"
#import "YPServiceViewController.h"


@implementation UIViewController (GlobalNavigation)

- (LTGlobalViewController*) globalViewController
{
    if (self.parentViewController) {
        if ([self.parentViewController isKindOfClass:[LTGlobalViewController class]]) {
            return (LTGlobalViewController*)self.parentViewController;
        } else {
            return [self.parentViewController globalViewController];
        }
    } else {
        return nil;
    }
}

@end

@interface LTGlobalViewController ()
{
    UIViewController* _mainVC;
}
@end
@implementation LTGlobalViewController
- (void) viewDidLoad
{
    [super viewDidLoad];
    if (LTShareAccountManager.currentAccount || YES)  {
        [self loadApplicationMainVC];
    } else {
        [self loadGuideViewController];
    }
}

- (void) lt_addViewController:(UIViewController*)vc
{
    [vc willMoveToParentViewController:self];
    [self addChildViewController:vc];
    [self.view addSubview:vc.view];
    vc.view.frame = self.view.bounds;
    [vc didMoveToParentViewController:self];
}

- (void) lt_removeChildViewController:(UIViewController*)vc {
    [vc willMoveToParentViewController:nil];
    [vc.view removeFromSuperview];
    [vc removeFromParentViewController];
    [vc didMoveToParentViewController:nil];
}
- (void) changeMainVC:(UIViewController*)vc
{
    [self lt_removeChildViewController:_mainVC];
    [self lt_addViewController:vc];
    _mainVC = vc;
}

- (void) loadGuideViewController
{
    LTAuthViewController* regsiterVC = [LTAuthViewController new];
    LTGuideContainerViewController* guidVC = [[LTGuideContainerViewController alloc] initWithRootViewController:regsiterVC];
    [self changeMainVC:guidVC];
}
- (void) loadApplicationMainVC
{
   
    
    LTMainViewController* mainVC = [[LTMainViewController alloc] init];
    
    LTNavigationController*(^NavigationWithRootVC)(UIViewController* vc) = ^(UIViewController* vc) {
        return [[LTNavigationController alloc] initWithRootViewController:vc];
    };
    
    YPMiniDataSync* mineDataSync = [YPMiniDataSync new];
    YPMineViewController* mineVc = [[YPMineViewController alloc] initWithSyncer:mineDataSync];
    
    YPQueueDataSync* ququeDataSync = [YPQueueDataSync new];
    YPQueueViewController* ququeViewController = [[YPQueueViewController alloc] initWithSyncer:ququeDataSync];
    
    YPServiceDataSync* serviceDataSync = [YPServiceDataSync new];
    YPServiceViewController* serviceVC = [[YPServiceViewController alloc] initWithSyncer:serviceDataSync];
    
    void (^DecorateViewControllerTableBar)(UIViewController* vc,
                                         NSString* title,
                                         NSString* imageName ,
                                         NSString* selectedImageName) =
    ^(UIViewController* vc,
      NSString* title,
      NSString* imageName ,
      NSString* selectedImageName) {
        vc.tabBarItem.title = title;
        vc.tabBarItem.image = DZCachedImageByName(imageName);
        vc.tabBarItem.selectedImage = DZCachedImageByName(selectedImageName);
    };
    
    DecorateViewControllerTableBar(mineVc, @"我", @"tab_mine", @"tab_mine_click");
    DecorateViewControllerTableBar(ququeViewController, @"队列", @"tab_quque", @"tab_queue_click");
    DecorateViewControllerTableBar(serviceVC, @"服务", @"tab_service", @"tab_service_click");
    
    
    
    mainVC.viewControllers  = @[NavigationWithRootVC(ququeViewController),
                                NavigationWithRootVC(serviceVC),
                                NavigationWithRootVC(mineVc)];
                                
    
    [self changeMainVC:mainVC];
}

- (void) viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];
}


@end
