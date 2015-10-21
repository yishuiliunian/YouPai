//
//  YPLocationManager.h
//  YouPai
//
//  Created by stonedong on 15/10/19.
//  Copyright © 2015年 stonedong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <DZSingletonFactory.h>

@interface YPLocation : NSObject
@property (nonatomic, assign) double latitude;
@property (nonatomic, assign) double longtitude;
@end

#define YPCurrentLocation [YPLocationManager shareManager].currentLocation

@interface YPLocationManager : NSObject
@property (nonatomic, strong, readonly) YPLocation* currentLocation;
DEFINE_SINGLONTON_SHARE_MANAGER(YPLocationManager)
@end
