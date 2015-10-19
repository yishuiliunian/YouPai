//
//  YPNormalCell.h
//  YouPai
//
//  Created by stonedong on 15/9/7.
//  Copyright (c) 2015年 stonedong. All rights reserved.
//

#import "DZLayoutTableViewCell.h"
#import <DZProgramDefines.h>
@interface YPNormalCell : DZLayoutTableViewCell
DEFINE_PROPERTY_STRONG_READONLY(UIImageView*, leftImageView);
DEFINE_PROPERTY_STRONG_READONLY(UILabel*, titleLabel);
DEFINE_PROPERTY_STRONG_READONLY(UILabel*, contentLabel);
@end
