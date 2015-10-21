//
//  YPThirdLableCell.h
//  YouPai
//
//  Created by stonedong on 15/10/21.
//  Copyright © 2015年 stonedong. All rights reserved.
//

#import "DZLayoutTableViewCell.h"
#import <DZProgramDefines.h>
@interface YPThirdLableCell : DZLayoutTableViewCell
DEFINE_PROPERTY_STRONG_UIImageView(leftImageView);
DEFINE_PROPERTY_STRONG_UILabel(topLabel);
DEFINE_PROPERTY_STRONG_UILabel(centerLabel);
DEFINE_PROPERTY_STRONG_UILabel(bottomLabel);
@end
