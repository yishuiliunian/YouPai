//
//  YPActionCell.h
//  YouPai
//
//  Created by stonedong on 15/9/9.
//  Copyright (c) 2015年 stonedong. All rights reserved.
//

#import "DZLayoutTableViewCell.h"
#import <DZProgramDefines.h>
#import <DZGeometryTools.h>
@interface YPActionCell : DZLayoutTableViewCell
DEFINE_PROPERTY_STRONG_UIImageView(actionImageView);
DEFINE_PROPERTY_STRONG_UILabel(actionLabel);
@end
