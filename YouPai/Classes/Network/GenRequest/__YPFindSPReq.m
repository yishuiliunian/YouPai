
#import "__YPFindSPReq.h"
#import <Mantle.h>
#import "YPFindSPRsp.h"
@implementation __YPFindSPReq

- (NSString*) method
{
    return @"/queue/api/queue/findSp";
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
        [self didGetMessage:[YPFindSPRsp new]];
    } else {
        id list = retobject[@"list"];
        if ([list isKindOfClass:[NSString class]]) {
            if ([list isEqualToString:@""]) {
                NSMutableDictionary* dic = [retobject mutableCopy];
                dic[@"list"] = [NSNull null];
                retobject = dic;
            }
        }
        YPFindSPRsp* message = [MTLJSONAdapter modelOfClass:NSClassFromString(@"YPFindSPRsp") fromJSONDictionary:retobject error:&error];
        if (error) {
            [self onError:error];
            return;
        }
        [self didGetMessage:message];
    }
}

- (void) didGetMessage:(YPFindSPRsp*)message
{
   [self doUIOnSuccced:message];
}
@end
