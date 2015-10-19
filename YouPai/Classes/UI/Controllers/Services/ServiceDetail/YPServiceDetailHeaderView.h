//
//  YPServiceDetailHeaderView.h
//  YouPai
//
//  Created by stonedong on 15/9/9.
//  Copyright (c) 2015年 stonedong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <DZGrowLabel.h>

#import <DZProgramDefines.h>
#import <DZGeometryTools.h>
@interface YPServiceDetailHeaderView : UIView
DEFINE_PROPERTY_STRONG_UIImageView(imageView);
DEFINE_PROPERTY_STRONG(DZGrowLabel*, addressLabel);
DEFINE_PROPERTY_STRONG(DZGrowLabel*, phoneLabel);
@end
