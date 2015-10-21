//
//  YPLocationManager.m
//  YouPai
//
//  Created by stonedong on 15/10/19.
//  Copyright © 2015年 stonedong. All rights reserved.
//

#import "YPLocationManager.h"
#import <DZProgramDefines.h>
#import "LTGlobals.h"
#import <INTULocationManager.h>
#import <CoreLocation/CoreLocation.h>
INIT_DZ_EXTERN_STRING(DZCurrentLocation, DZCurrentLocation)
INIT_DZ_EXTERN_STRING(LocationLat, lat)
INIT_DZ_EXTERN_STRING(LocationLng, lng)

@implementation YPLocation : NSObject
- (void) setValue:(id)value forKey:(NSString *)key
{
    if([key isEqualToString:LocationLat]) {
        _latitude = [value doubleValue];
    } else if ([key isEqualToString:LocationLng]) {
        _longtitude = [value doubleValue];
    }
}

- (id) valueForKey:(NSString *)key
{
    if ([key isEqualToString:LocationLng]) {
        return @(_longtitude);
    } else if ([key isEqualToString:LocationLat]) {
        return @(_latitude);
    } else {
        return @"";
    }
}

- (NSDictionary*) dictionary
{
    return @{
             LocationLat : @(_latitude),
             LocationLng : @(_longtitude)
             };
}
@end


@implementation YPLocationManager
IMP_SINGLONTON_SHARE_MANAGER(YPLocationManager);

- (instancetype) init
{
    self = [super init];
    if (!self) {
        return self;
    }
    [self restore];
    [self refresh];
    return self;
}

- (void) refresh
{
    
    __weak typeof(self)weakSelf = self;
    [[INTULocationManager sharedInstance] subscribeToLocationUpdatesWithDesiredAccuracy:INTULocationAccuracyCity block:^(CLLocation *currentLocation, INTULocationAccuracy achievedAccuracy, INTULocationStatus status) {
       [weakSelf decodeLocationWith:currentLocation];
    }];
}

- (void) store
{
    if (_currentLocation) {
        NSDictionary* l = [_currentLocation dictionary];
        [[NSUserDefaults standardUserDefaults] setObject:l forKey:DZCurrentLocation];
    }
}
- (void) decodeLocationWith:(CLLocation*)la
{
    YPLocation* location = [YPLocation new];
    location.longtitude = la.coordinate.longitude;
    location.latitude = la.coordinate.latitude;
    _currentLocation = location;
    [self store];
    
}
- (void) restore
{
    NSDictionary* l = [[NSUserDefaults standardUserDefaults] objectForKey:DZCurrentLocation];
    _currentLocation = [YPLocation new];
    if (l) {
        [_currentLocation setValuesForKeysWithDictionary:l];
    } else {
        _currentLocation.latitude = 20.0;
        _currentLocation.longtitude = 30.0;
    }

}
@end
