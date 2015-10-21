//
//  YPService.h
//  YouPai
//
//  Created by stonedong on 15/9/19.
//  Copyright (c) 2015年 stonedong. All rights reserved.
//

#import <Realm/Realm.h>
#import "YPSpSimpleModel.h"
@interface YPService : RLMObject
@property (nonatomic, strong) NSString* identifier;
@property (nonatomic, strong) NSString* name;
@property (nonatomic, assign) BOOL watching;
@property (nonatomic, strong) NSString* addressName;
@property (nonatomic, strong) NSString* headerURL;

- (instancetype) initWithServerData:(YPSpSimpleModel*)model;

+ (RLMResults*) watchedService;
@end

RLM_ARRAY_TYPE(YPService)
