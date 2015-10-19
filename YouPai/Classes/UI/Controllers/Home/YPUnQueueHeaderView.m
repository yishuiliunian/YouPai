//
//  YPUnQueueHeaderView.m
//  YouPai
//
//  Created by stonedong on 15/9/7.
//  Copyright (c) 2015年 stonedong. All rights reserved.
//

#import "YPUnQueueHeaderView.h"
#import <DZGeometryTools.h>
@interface YPUnQueueHeaderView ()
DEFINE_PROPERTY_STRONG_UIImageView(backgroundImageView);
@end



@implementation YPUnQueueHeaderView

- (instancetype) initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (!self) {
        return self;
    }
    INIT_SELF_SUBVIEW_UIImageView(_backgroundImageView);
    INIT_SUBVIEW_UIButton(self, _queueButton);
    _queueButton.layer.borderColor = [UIColor whiteColor].CGColor;
    _queueButton.layer.borderWidth = 1;
    _queueButton.layer.cornerRadius = 2;
    [_queueButton setTitle:@"排队取号" forState:UIControlStateNormal];
    
#if DEBUG
    _backgroundImageView.backgroundColor = [UIColor redColor];
#endif
    return self;
}


- (void) layoutSubviews
{
    [super layoutSubviews];
    _backgroundImageView.frame = self.bounds;
    _queueButton.frame = CGRectCenter(self.bounds, CGSizeMake(150, 50));
}
@end
