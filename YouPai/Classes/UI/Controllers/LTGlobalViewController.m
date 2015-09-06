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
    [self loadApplicationMainVC];
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
    LTGuideContainerViewController* guidVC = [LTGuideContainerViewController new];
    [self changeMainVC:guidVC];
}
- (void) loadApplicationMainVC
{
   
    
    LTMainViewController* mainVC = [[LTMainViewController alloc] init];
    
    LTNavigationController*(^NavigationWithRootVC)(UIViewController* vc) = ^(UIViewController* vc) {
        return [[LTNavigationController alloc] initWithRootViewController:vc];
    };
//    
//    mainVC.viewControllers  = @[NavigationWithRootVC(selectedVC),
//                                NavigationWithRootVC(discoverVC),
//                                NavigationWithRootVC(carMeetVC),
//                                NavigationWithRootVC(mineVC)];
    
    [self changeMainVC:mainVC];
}

- (void) viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];
}

-  (void) loadAuthViewController:(LTAuthSucceedBlock)block
{
//    LTAuthViewController* authViewController  = [[LTAuthViewController alloc] initWithNibName:nil bundle:nil];
//    LTGuideContainerViewController* nav = [[LTGuideContainerViewController alloc] initWithRootViewController:authViewController];
//    nav.succeedBlock = block;
//    [self presentViewController:nav animated:YES completion:nil];
}
@end
