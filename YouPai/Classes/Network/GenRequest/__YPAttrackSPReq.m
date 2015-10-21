
#import "__YPAttrackSPReq.h"
#import <Mantle.h>
#import "YPSpSimpleModelList.h"
@implementation __YPAttrackSPReq

- (NSString*) method
{
    return @"/queue/api/account/findAtts";
}
- (bool) loadParamters:(NSError *__autoreleasing *)error
{
    SendSuperFunctionWithError(loadParamters);
    
[self addParamter:self.userId forKey:@"userId"];

    return YES;
}
- (void) onSuccess:(id)retobject
{
    NSError* error = nil;
    if ([retobject isKindOfClass:[NSArray class]]) {
        retobject = @{@"list":retobject};
    }
    if ([retobject isKindOfClass:[NSNull class]]) {
        [self didGetMessage:[YPSpSimpleModelList new]];
    } else {
        id list = retobject[@"list"];
        if ([list isKindOfClass:[NSString class]]) {
            if ([list isEqualToString:@""]) {
                NSMutableDictionary* dic = [retobject mutableCopy];
                dic[@"list"] = [NSNull null];
                retobject = dic;
            }
        }
        YPSpSimpleModelList* message = [MTLJSONAdapter modelOfClass:NSClassFromString(@"YPSpSimpleModelList") fromJSONDictionary:retobject error:&error];
        if (error) {
            [self onError:error];
            return;
        }
        [self didGetMessage:message];
    }
}

- (void) didGetMessage:(YPSpSimpleModelList*)message
{
   [self doUIOnSuccced:message];
}
@end
