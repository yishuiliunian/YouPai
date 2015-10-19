//
//  YPService.m
//  YouPai
//
//  Created by stonedong on 15/9/19.
//  Copyright (c) 2015年 stonedong. All rights reserved.
//

#import "YPService.h"

@implementation YPService

+ (RLMResults*) watchedService
{
    return [YPService objectsWhere:@"watching == YES"];
}

+ (NSString*)primaryKey
{
    return @"identifier";
}
// Specify default values for properties

#define SET_DEAULT_VALUE(key, value) key:value
#define SET_NULL_STRING(key) key:@""
+ (NSDictionary *)defaultPropertyValues
{
    
    return @{
             SET_DEAULT_VALUE(@"identifier", @""),
             SET_NULL_STRING(@"name"),
             SET_NULL_STRING(@"addressName"),
             SET_NULL_STRING(@"headerURL")
             };
}

// Specify properties to ignore (Realm won't persist these)

//+ (NSArray *)ignoredProperties
//{
//    return @[];
//}

@end
