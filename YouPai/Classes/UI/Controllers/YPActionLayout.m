//
//  YPActionLayout.m
//  YouPai
//
//  Created by stonedong on 15/9/9.
//  Copyright (c) 2015年 stonedong. All rights reserved.
//

#import "YPActionLayout.h"
#import "YPActionCell.h"
@implementation YPActionLayout
- (instancetype) init
{
    self = [super init];
    if (!self) {
        return self;
    }
    self.cellHeight = 44;
    self.cellClass = [YPActionCell class];
    return self;
}
- (instancetype) initWithImage:(UIImage*)image title:(NSString*)title
{
    self = [self init];
    if (!self) {
        return self;
    }
    _image = image;
    _title = title;
    return self;
}

#define ENSURE_CELL_CLASS(cla) \
if (![cell isKindOfClass:[cla class]]) { \
return; \
} \
cla * aCell = (cla*)cell;\


- (void) loadContentForCell:(DZLayoutTableViewCell *)cell
{
    ENSURE_CELL_CLASS(YPActionCell)
    aCell.actionImageView.image = self.image;
    aCell.actionLabel.text = self.title;
}

- (void) layoutTableViewCell:(DZLayoutTableViewCell *)cell
{
    ENSURE_CELL_CLASS(YPActionCell)
    CGSize imageSize = CGSizeMake(20  , 20);
    CGRect contentRect = CGRectCenterSubSize(aCell.contentView.frame, CGSizeMake(20, 0));
    
    CGRect imageRect;
    CGRect textRect;
    
    CGRectDivide(contentRect, &imageRect, &textRect, imageSize.width, CGRectMinXEdge);
    
    textRect = CGRectShrink(textRect, 10, CGRectMinXEdge);
    
    aCell.actionImageView.frame = CGRectCenter(imageRect, imageSize);
    aCell.actionLabel.frame = textRect;
}

@end
