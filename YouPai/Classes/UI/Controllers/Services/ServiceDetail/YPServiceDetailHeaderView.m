//
//  YPServiceDetailHeaderView.m
//  YouPai
//
//  Created by stonedong on 15/9/9.
//  Copyright (c) 2015年 stonedong. All rights reserved.
//

#import "YPServiceDetailHeaderView.h"
#import <AdjustFrame.h>
#import "LKHaneke.h"

const CGFloat kImageHeight  = 100;
@implementation YPServiceDetailHeaderView

- (instancetype) initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (!self) {
        return self;
    }
    INIT_SELF_SUBVIEW_UIImageView(_imageView);
    INIT_SELF_SUBVIEW(DZGrowLabel, _addressLabel);
    INIT_SELF_SUBVIEW(DZGrowLabel, _phoneLabel);
    _imageView.hnk_cacheFormat = LTHanekeCacheFormatFeedBackground();
    return self;
}
- (void) handleAdjustFrame
{
    self.adjustHeight = kImageHeight + _addressLabel.adjustHeight + _phoneLabel.adjustHeight;
    [self setNeedsLayout];
}

- (void) layoutSubviews
{
    [super layoutSubviews];
    
    _imageView.frame =CGRectMake(0, 0, CGRectViewWidth, kImageHeight);
    CGRect textContentRect = CGRectCenterSubSize(self.frame, CGSizeMake(20, 0));
    textContentRect = CGRectShrink(textContentRect, kImageHeight, CGRectMinYEdge);
    
    CGRect addressRect;
    CGRect phoeRect;
    
    CGRectDivide(textContentRect, &addressRect, &phoeRect, _addressLabel.adjustHeight, CGRectMinYEdge);
    _addressLabel.frame = addressRect;
    _phoneLabel.frame = phoeRect;
}


@end
