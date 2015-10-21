//
//  YPThirdLineLayout.m
//  YouPai
//
//  Created by stonedong on 15/10/21.
//  Copyright © 2015年 stonedong. All rights reserved.
//

#import "YPThirdLineLayout.h"
#import "YPThirdLableCell.h"
#import <DZGeometryTools.h>
#import "LKHaneke.h"
@implementation YPThirdLineLayout
- (instancetype) init
{
    self = [super init];
    if (!self) {
        return self;
    }
    self.cellHeight = 100;
    self.cellClass = [YPThirdLableCell class];
    return self;
}

- (void) layoutTableViewCell:(DZLayoutTableViewCell *)cell
{
    if (![cell isKindOfClass:[YPThirdLableCell class]]) {
        return;
    }
    
    YPThirdLableCell* aCell = (YPThirdLableCell*)cell;
    
    CGRect contentRect = CGRectCenterSubSize(aCell.contentView.frame, CGSizeMake(20, 20));
    
    CGRect imageRect;
    CGRectDivide(contentRect, &imageRect, &contentRect, CGRectGetHeight(contentRect), CGRectMinXEdge);
    contentRect = CGRectShrink(contentRect, 10, CGRectMinXEdge);
    
    CGRect rects[3];
    CGRectVerticalSplit(contentRect, rects, 3, 2);
    
    
    aCell.leftImageView.frame = imageRect;
    aCell.topLabel.frame = rects[0];
    aCell.centerLabel.frame = rects[1];
    aCell.bottomLabel.frame = rects[2];
}

- (void) loadContentForCell:(DZLayoutTableViewCell *)cell
{
    if (![cell isKindOfClass:[YPThirdLableCell class]]) {
        return;
    }
    YPThirdLableCell* aCell = (YPThirdLableCell*)cell;
    aCell.topLabel.text = self.topText;
    aCell.bottomLabel.text = self.bottomText;
    aCell.centerLabel.text = self.centerText;
    [aCell.leftImageView loadLittleImageURL:[NSURL URLWithString:self.imageURL]];
}
@end
