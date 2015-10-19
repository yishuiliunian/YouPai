//
//  YPQueueHeaderView.h
//  YouPai
//
//  Created by stonedong on 15/9/7.
//  Copyright (c) 2015年 stonedong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AdjustFrame.h>
#import <DZGeometryTools.h>
#import <DZProgramDefines.h>
@interface YPQueueHeaderView : UIView
DEFINE_PROPERTY_STRONG_UIImageView(backgroundImageView);
DEFINE_PROPERTY_STRONG_UILabel(prefixLabel);
DEFINE_PROPERTY_STRONG_UILabel(subfixLabel);
DEFINE_PROPERTY_STRONG_UILabel(countLabel);

DEFINE_PROPERTY_ASSIGN_INT32(count);
DEFINE_PROPERTY_ASSIGN_INT32(time);
@end
