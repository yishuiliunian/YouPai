//
//  YPMineHeaderView.m
//  YouPai
//
//  Created by stonedong on 15/9/9.
//  Copyright (c) 2015年 stonedong. All rights reserved.
//

#import "YPMineHeaderView.h"
#import <DZGeometryTools.h>
#import "LKHaneke.h"
#import "UIButton+decorate.h"
@implementation YPMineHeaderView

- (instancetype) initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (!self) {
        return self;
    }
    INIT_SELF_SUBVIEW_UIImageView(_backgroundImageView);
    INIT_SELF_SUBVIEW_UIImageView(_headImageView);
    INIT_SELF_SUBVIEW_UILabel(_nickLabel);
    INIT_SUBVIEW_UIButton(self, _settingButton);
    [self loadCustomAppearance];
    return self;
}

- (void) loadCustomAppearance
{
    _headImageView.hnk_cacheFormat = LTHanekeCacheFormatAvatar();
    _headImageView.layer.masksToBounds = YES;
    [_settingButton decorateWithImage:@"settings" highLightImage:@"settings" title:nil];
    _nickLabel.textAlignment = NSTextAlignmentCenter;
}

- (void) layoutSubviews
{
    [super layoutSubviews];
    CGRect contentRect = CGRectCenterSubSize(self.bounds, CGSizeMake(0, 20));
    _backgroundImageView.frame = contentRect;
    _headImageView.frame = CGRectCenter(contentRect, CGSizeMake(100, 100));
    
    _headImageView.layer.cornerRadius = CGRectGetHeight(_headImageView.frame)/2;
    CGRect nickRect = CGRectCenterSubSize(contentRect, CGSizeMake(20, 0));
    nickRect.size.height = 20;
    nickRect.origin.y = CGRectGetMaxY(_headImageView.frame);
    
    _nickLabel.frame = nickRect;
    
    CGSize setSize = CGSizeMake(30, 30);
    _settingButton.frame = CGRectMake(CGRectGetWidth(self.bounds) - 10 - setSize.width, 10, setSize.width, setSize.height);
}


@end
