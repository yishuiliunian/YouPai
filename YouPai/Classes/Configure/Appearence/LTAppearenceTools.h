//
//  LTAppearenceTools.h
//  LuTu
//
//  Created by stonedong on 15/4/6.
//  Copyright (c) 2015年 Road.Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "LTColors.h"
#import "LTFont.h"
#import <DZStyle.h>
#import <DZLabelStyle.h>


FOUNDATION_EXTERN void LTAppearanceSetup();

FOUNDATION_EXTERN UIImage* imageWithColor(UIColor *color);
FOUNDATION_EXTERN UIImage* imageWithGradients(NSArray *colours);
#define LTLayoutXOffset 15
#define LTLayoutYOffset 10

FOUNDATION_EXTERN CGFloat LTFeedContentWidth();

//
EXTERN_SHARE_TEXT_STYLE(TextTitle);
EXTERN_SHARE_TEXT_STYLE(TextContent);
EXTERN_SHARE_LABEL_STYLE(LabelContent);
//
typedef enum {
   LTNavigationStyleTransparency,
    LTNavigationStyleBlack
}LTNavigationStyle;
@interface UIViewController (Appearance)
@property (nonatomic, assign) LTNavigationStyle naviationBarStyle;
- (void) loadNavigationBarAppearance:(LTNavigationStyle)style;
@end


