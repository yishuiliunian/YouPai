//
//  YPActionCell.m
//  YouPai
//
//  Created by stonedong on 15/9/9.
//  Copyright (c) 2015年 stonedong. All rights reserved.
//

#import "YPActionCell.h"

@implementation YPActionCell

- (instancetype) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (!self) {
        return self;
    }
    INIT_SUBVIEW_UIImageView(self.contentView, _actionImageView);
    INIT_SUBVIEW_UILabel(self.contentView, _actionLabel);
    return self;
}

@end
