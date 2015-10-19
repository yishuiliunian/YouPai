
#import "__YPUserLoginReq.h"
#import <Mantle.h>
#import "YPUserLoginRsq.h"
@implementation __YPUserLoginReq

- (NSString*) method
{
    return @"/queue/api/account/login";
}
- (bool) loadParamters:(NSError *__autoreleasing *)error
{
    SendSuperFunctionWithError(loadParamters);
    
[self addParamter:self.uname forKey:@"uname"];
[self addParamter:self.passwd forKey:@"passwd"];

    return YES;
}
- (void) onSuccess:(id)retobject
{
    NSError* error = nil;
    if ([retobject isKindOfClass:[NSArray class]]) {
        retobject = @{@"list":retobject};
    }
    if ([retobject isKindOfClass:[NSNull class]]) {
        [self didGetMessage:[YPUserLoginRsq new]];
    } else {
        id list = retobject[@"list"];
        if ([list isKindOfClass:[NSString class]]) {
            if ([list isEqualToString:@""]) {
                NSMutableDictionary* dic = [retobject mutableCopy];
                dic[@"list"] = [NSNull null];
                retobject = dic;
            }
        }
        YPUserLoginRsq* message = [MTLJSONAdapter modelOfClass:NSClassFromString(@"YPUserLoginRsq") fromJSONDictionary:retobject error:&error];
        if (error) {
            [self onError:error];
            return;
        }
        [self didGetMessage:message];
    }
}

- (void) didGetMessage:(YPUserLoginRsq*)message
{
   [self doUIOnSuccced:message];
}
@end
