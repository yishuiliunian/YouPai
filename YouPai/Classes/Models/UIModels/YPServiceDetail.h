//
//  YPServiceDetail.h
//  YouPai
//
//  Created by stonedong on 15/9/19.
//  Copyright © 2015年 stonedong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <DZProgramDefines.h>
#import "YPBusiniess.h"
@interface YPServiceDetail : NSObject
DEFINE_PROPERTY_STRONG_NSString(identifier);
DEFINE_PROPERTY_STRONG_NSString(name);
DEFINE_PROPERTY_STRONG_NSString(address);
DEFINE_PROPERTY_STRONG_NSString(phoneNumber);
DEFINE_PROPERTY_ASSIGN_BOOL(watched);
DEFINE_PROPERTY_STRONG(NSArray*, imageURLs);
DEFINE_PROPERTY_STRONG(NSArray*, businiesses);

@end
