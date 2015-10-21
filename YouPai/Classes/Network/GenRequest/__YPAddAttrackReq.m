
#import "__YPAddAttrackReq.h"
#import <Mantle.h>
#import "YPNullModel.h"
@implementation __YPAddAttrackReq

- (NSString*) method
{
    return @"/queue/api/account/addAtts";
}
- (bool) loadParamters:(NSError *__autoreleasing *)error
{
    SendSuperFunctionWithError(loadParamters);
    
[self addParamter:self.userId forKey:@"userId"];
[self addParamter:self.spId forKey:@"spId"];

    return YES;
}
- (void) onSuccess:(id)retobject
{
    NSError* error = nil;
    if ([retobject isKindOfClass:[NSArray class]]) {
        retobject = @{@"list":retobject};
    }
    if ([retobject isKindOfClass:[NSNull class]]) {
        [self didGetMessage:[YPNullModel new]];
    } else {
        id list = retobject[@"list"];
        if ([list isKindOfClass:[NSString class]]) {
            if ([list isEqualToString:@""]) {
                NSMutableDictionary* dic = [retobject mutableCopy];
                dic[@"list"] = [NSNull null];
                retobject = dic;
            }
        }
        YPNullModel* message = [MTLJSONAdapter modelOfClass:NSClassFromString(@"YPNullModel") fromJSONDictionary:retobject error:&error];
        if (error) {
            [self onError:error];
            return;
        }
        [self didGetMessage:message];
    }
}

- (void) didGetMessage:(YPNullModel*)message
{
   [self doUIOnSuccced:message];
}
@end
