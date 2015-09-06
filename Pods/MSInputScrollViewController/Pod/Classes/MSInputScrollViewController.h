//
//  MSInputScrollViewController.h
//  MoShang
//
//  Created by stonedong on 15/2/12.
//  Copyright (c) 2015年 stonedong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <DZGeometryTools.h>
@interface UIView (Extand)
@property (nonatomic, assign) BOOL isScrollInputView;
@end

@interface MSInputScrollViewController : UIViewController
@property (nonatomic, strong, readonly) UIScrollView* scrollView;
@property (nonatomic, assign, readonly) BOOL isKeyboardShowing;
- (void) reloadScrollContentSize;
@end
