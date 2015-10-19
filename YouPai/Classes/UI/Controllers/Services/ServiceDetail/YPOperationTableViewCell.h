//
//  YPOperationTableViewCell.h
//  YouPai
//
//  Created by stonedong on 15/9/12.
//  Copyright (c) 2015年 stonedong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <DZProgramDefines.h>
#import "YPBusiniess.h"
@interface YPOperationTableViewCell : UITableViewCell
DEFINE_PROPERTY_STRONG_UIButton(ququeButton);
DEFINE_PROPERTY_STRONG_UILabel(titleLabel);
DEFINE_PROPERTY_STRONG_UILabel(detailLabel);
DEFINE_PROPERTY_STRONG(YPBusiniess*, businiess);
@end
