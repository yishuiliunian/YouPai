
#import "__YPHistoryReq.h"
#import <Mantle.h>
#import "YPQueueHistoryRecordList.h"
@implementation __YPHistoryReq

- (NSString*) method
{
    return @"/queue/api/account/findUQS";
}
- (bool) loadParamters:(NSError *__autoreleasing *)error
{
    SendSuperFunctionWithError(loadParamters);
    
[self addParamter:self.userId forKey:@"userId"];
[self addParamter:self.startDate forKey:@"startDate"];
[self addParamter:self.endDate forKey:@"endDate"];
[self addParamterNumber:@(self.status) forKey:@"status"];

    return YES;
}
- (void) onSuccess:(id)retobject
{
    NSError* error = nil;
    if ([retobject isKindOfClass:[NSArray class]]) {
        retobject = @{@"list":retobject};
    }
    if ([retobject isKindOfClass:[NSNull class]]) {
        [self didGetMessage:[YPQueueHistoryRecordList new]];
    } else {
        id list = retobject[@"list"];
        if ([list isKindOfClass:[NSString class]]) {
            if ([list isEqualToString:@""]) {
                NSMutableDictionary* dic = [retobject mutableCopy];
                dic[@"list"] = [NSNull null];
                retobject = dic;
            }
        }
        YPQueueHistoryRecordList* message = [MTLJSONAdapter modelOfClass:NSClassFromString(@"YPQueueHistoryRecordList") fromJSONDictionary:retobject error:&error];
        if (error) {
            [self onError:error];
            return;
        }
        [self didGetMessage:message];
    }
}

- (void) didGetMessage:(YPQueueHistoryRecordList*)message
{
   [self doUIOnSuccced:message];
}
@end
