//
//  YPRealmManager.m
//  YouPai
//
//  Created by stonedong on 15/9/19.
//  Copyright (c) 2015年 stonedong. All rights reserved.
//

#import "YPRealmManager.h"
#import <Realm/Realm.h>


void YPRealmCreateOrUpdateObject(NSArray* objects) {

    [YPRealmStore beginWriteTransaction];
    for (RLMObject* ob in objects) {
        [[ob class] createOrUpdateInRealm:YPRealmStore withValue:ob];
    }
    [YPRealmStore commitWriteTransaction];
}

@implementation YPRealmManager
- (instancetype) init
{
    self = [super init];
    if (!self)
    {
        return self;
    }
    return self;
}
@end
