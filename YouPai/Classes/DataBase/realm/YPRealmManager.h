//
//  YPRealmManager.h
//  YouPai
//
//  Created by stonedong on 15/9/19.
//  Copyright (c) 2015年 stonedong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Realm/Realm.h>

#define YPRealmStore [RLMRealm defaultRealm]

void YPRealmCreateOrUpdateObject(NSArray* objects);
@interface YPRealmManager : NSObject

@end
