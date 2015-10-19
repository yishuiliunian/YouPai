//
//  DZNormalLayout.m
//  YouPai
//
//  Created by stonedong on 15/9/7.
//  Copyright (c) 2015年 stonedong. All rights reserved.
//

#import "DZNormalLayout.h"
#import "YPNormalCell.h"
#import <DZGeometryTools.h>
#import <LKHaneke.h>
@implementation DZNormalLayout

- (instancetype) init
{
    self = [super init];
    if (!self) {
        return self;
    }
    self.cellHeight = 100;
    self.cellClass = [YPNormalCell class];
    return self;
}

- (void) layoutTableViewCell:(DZLayoutTableViewCell *)cell
{
    if (![cell isKindOfClass:[YPNormalCell class]]) {
        return;
    }
    
    YPNormalCell* aCell = (YPNormalCell*)cell;
    
    CGRect contentRect = CGRectCenterSubSize(aCell.contentView.frame, CGSizeMake(20, 20));
    
    CGRect imageRect;
    CGRectDivide(contentRect, &imageRect, &contentRect, CGRectGetHeight(contentRect), CGRectMinXEdge);
    contentRect = CGRectShrink(contentRect, 10, CGRectMinXEdge);
    CGRect titleRect;
    CGRect detailRect;
    
    CGRectDivide(contentRect, &titleRect, &detailRect, 20, CGRectMinYEdge);
    
    detailRect = CGRectShrink(detailRect, 5, CGRectMinYEdge);
    
    aCell.leftImageView.frame = imageRect;
    aCell.titleLabel.frame = titleRect;
    aCell.contentLabel.frame = detailRect;
}

- (void) loadContentForCell:(DZLayoutTableViewCell *)cell
{
    if (![cell isKindOfClass:[YPNormalCell class]]) {
        return;
    }
    YPNormalCell* aCell = (YPNormalCell*)cell;
    aCell.titleLabel.text  = self.title;
    aCell.contentLabel.text = self.content;
    [aCell.leftImageView loadAvatarURL:[NSURL URLWithString:self.imageURL]];
}
@end
