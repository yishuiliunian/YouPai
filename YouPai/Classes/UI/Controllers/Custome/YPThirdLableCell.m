//
//  YPThirdLableCell.m
//  YouPai
//
//  Created by stonedong on 15/10/21.
//  Copyright © 2015年 stonedong. All rights reserved.
//

#import "YPThirdLableCell.h"

#import "LKHaneke.h"
#import "LTAppearenceTools.h"
@implementation YPThirdLableCell
- (instancetype) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (!self) {
        return self;
    }
    INIT_SUBVIEW_UIImageView(self.contentView, _leftImageView);
    INIT_SUBVIEW_UILabel(self.contentView, _topLabel);
    INIT_SUBVIEW_UILabel(self.contentView, _bottomLabel);
    INIT_SUBVIEW_UILabel(self.contentView, _centerLabel);
    
    [DZStyleTextContent() decorateView:_centerLabel];
    [DZStyleTextTitle() decorateView:_topLabel];
    [DZStyleTextContent() decorateView:_bottomLabel];
    _leftImageView.hnk_cacheFormat = LTHanekeCacheFormatAvatar();
    _leftImageView.layer.masksToBounds = YES;
    return self;
}
@end
