//
//  AppDelegate.h
//  YouPai
//
//  Created by stonedong on 15/8/23.
//  Copyright (c) 2015年 stonedong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LTGlobalViewController.h"
@interface AppDelegate : UIResponder <UIApplicationDelegate>
@property (nonatomic, strong, readonly) LTGlobalViewController* globalViewController;
@property (strong, nonatomic) UIWindow *window;


@end

