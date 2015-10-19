
#import "__YPSPDetailReq.h"
#import <Mantle.h>
#import "YPSPDetail.h"
@implementation __YPSPDetailReq

- (NSString*) method
{
    return @"/queue/api/queue/findSpAndSpType";
}
- (bool) loadParamters:(NSError *__autoreleasing *)error
{
    SendSuperFunctionWithError(loadParamters);
    
[self addParamterNumber:@(self.lng) forKey:@"lng"];
[self addParamterNumber:@(self.lat) forKey:@"lat"];

    return YES;
}
- (void) onSuccess:(id)retobject
{
    NSError* error = nil;
    if ([retobject isKindOfClass:[NSArray class]]) {
        retobject = @{@"list":retobject};
    }
    if ([retobject isKindOfClass:[NSNull class]]) {
        [self didGetMessage:[YPSPDetail new]];
    } else {
        id list = retobject[@"list"];
        if ([list isKindOfClass:[NSString class]]) {
            if ([list isEqualToString:@""]) {
                NSMutableDictionary* dic = [retobject mutableCopy];
                dic[@"list"] = [NSNull null];
                retobject = dic;
            }
        }
        YPSPDetail* message = [MTLJSONAdapter modelOfClass:NSClassFromString(@"YPSPDetail") fromJSONDictionary:retobject error:&error];
        if (error) {
            [self onError:error];
            return;
        }
        [self didGetMessage:message];
    }
}

- (void) didGetMessage:(YPSPDetail*)message
{
   [self doUIOnSuccced:message];
}
@end
