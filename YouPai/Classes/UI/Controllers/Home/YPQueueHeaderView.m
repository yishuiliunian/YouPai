//
//  YPQueueHeaderView.m
//  YouPai
//
//  Created by stonedong on 15/9/7.
//  Copyright (c) 2015年 stonedong. All rights reserved.
//

#import "YPQueueHeaderView.h"
#import <AdjustFrame.h>
#import <DZImageCache.h>
#import <BonMot.h>
#import <StyleSheet/DZLabelStyle.h>
@interface YPQueueHeaderView ()
DEFINE_PROPERTY_STRONG_UIImageView(circleImageView);
DEFINE_PROPERTY_STRONG_UILabel(renLabel);
@end

@implementation YPQueueHeaderView
- (instancetype) initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (!self) {
        return self;
    }
    
    INIT_SELF_SUBVIEW_UIImageView(_backgroundImageView);
    INIT_SELF_SUBVIEW_UIImageView(_circleImageView);
    INIT_SELF_SUBVIEW_UILabel(_prefixLabel);
    INIT_SELF_SUBVIEW_UILabel(_subfixLabel);
    INIT_SELF_SUBVIEW_UILabel(_countLabel);
    INIT_SELF_SUBVIEW_UILabel(_renLabel);
    
    _prefixLabel.textAlignment = NSTextAlignmentRight;
    _subfixLabel.textAlignment = NSTextAlignmentRight;
    _countLabel.textAlignment = NSTextAlignmentCenter;
    
    _backgroundImageView.image = DZCachedImageByName(@"inqueue_bg");
    _circleImageView.image = DZCachedImageByName(@"queue_circle");
    return self;
}

- (void) layoutSubviews
{
    [super layoutSubviews];
   
    _backgroundImageView.frame = self.bounds;
    CGRect contentRect = CGRectCenterSubSize(self.bounds, CGSizeMake(20, 20));
    CGSize countSize = CGSizeMake(150, 150);
    
    contentRect = CGRectCenter(contentRect, CGSizeMake(CGRectGetWidth(contentRect), countSize.height));
    CGFloat width = (CGRectGetWidth(contentRect) - countSize.width) /2;
    
    CGRect prefixRect;
    CGRect countRect;
    CGRect subfixRect;
    
    CGRectDivide(contentRect, &prefixRect, &countRect, width, CGRectMinXEdge);
    CGRectDivide(countRect, &countRect, &subfixRect, countSize.width, CGRectMinXEdge);
    
    _circleImageView.frame = countRect;
    
    _prefixLabel.frame = prefixRect;
    _countLabel.frame = CGRectCenter(countRect, CGSizeMake(50, 50));
    _subfixLabel.frame = subfixRect;
    
    _renLabel.frame = CGRectMake(CGRectGetMaxX(_countLabel.frame), CGRectGetMaxY(_countLabel.frame) - 20, 20, 20);
    
}

- (void) setCount:(int32_t)count
{
    _count = count;
    [self updateDisplay];
}

- (void) setTime:(int32_t)time
{
    _time = time;
    [self updateDisplay];
}
- (void) updateDisplay
{

    DZTextStyle* normal = DZTextStyleMake(
                                          style.textColor = [UIColor whiteColor];
                                          style.font = [UIFont systemFontOfSize:15];
    )
    
   DZLabelStyle* labelStyle =  DZLabelStyleMake(
                                                style.textStyle = normal;
                                                style.adjustsFontSizeToFitWidth = YES;
                                                style.backgroundColor =[UIColor clearColor];
    )
    
    
    _countLabel.textColor = [UIColor orangeColor];
    _countLabel.font = [UIFont boldSystemFontOfSize:30];
    _countLabel.textAlignment = NSTextAlignmentCenter;
    _countLabel.adjustsFontSizeToFitWidth = YES;
    _countLabel.text = [@(self.count) stringValue];
    
    [labelStyle decorateView:_renLabel];
    _renLabel.textAlignment = NSTextAlignmentLeft;
    _renLabel.text = @"人";
    
    [labelStyle decorateView:_prefixLabel];
    _prefixLabel.textAlignment = NSTextAlignmentRight;
    _prefixLabel.text = @"您的前面还有";
    
    
    [labelStyle decorateView:_subfixLabel];
    _subfixLabel.textAlignment = NSTextAlignmentLeft;
    NSString* subfix= [NSString stringWithFormat:@"预计还有%@",@"1个小时"];
    _subfixLabel.text = subfix;
}

@end
