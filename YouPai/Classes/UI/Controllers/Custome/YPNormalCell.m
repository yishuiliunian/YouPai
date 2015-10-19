//
//  YPNormalCell.m
//  YouPai
//
//  Created by stonedong on 15/9/7.
//  Copyright (c) 2015年 stonedong. All rights reserved.
//

#import "YPNormalCell.h"
#import "LTAppearenceTools.h"
#import "LKHaneke.h"
@implementation YPNormalCell
- (instancetype) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (!self) {
        return self;
    }
    INIT_SUBVIEW_UIImageView(self.contentView, _leftImageView);
    INIT_SUBVIEW_UILabel(self.contentView, _titleLabel);
    INIT_SUBVIEW_UILabel(self.contentView, _contentLabel);
    
    [DZStyleTextContent() decorateView:_contentLabel];
    [DZStyleTextTitle() decorateView:_titleLabel];
    _leftImageView.hnk_cacheFormat = LTHanekeCacheFormatAvatar();
    _leftImageView.layer.masksToBounds = YES;
    return self;
}


@end
