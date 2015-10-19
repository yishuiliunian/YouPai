//
//  YPMineHeaderView.h
//  YouPai
//
//  Created by stonedong on 15/9/9.
//  Copyright (c) 2015年 stonedong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <DZProgramDefines.h>
#import <AdjustFrame.h>
@interface YPMineHeaderView : UIView
DEFINE_PROPERTY_STRONG_UIImageView(backgroundImageView);
DEFINE_PROPERTY_STRONG_UIImageView(headImageView);
DEFINE_PROPERTY_STRONG_UIButton(settingButton);
DEFINE_PROPERTY_STRONG_UILabel(nickLabel);
@end
