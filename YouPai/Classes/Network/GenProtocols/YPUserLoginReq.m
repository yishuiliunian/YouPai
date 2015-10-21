
#import "YPUserLoginReq.h"

@implementation YPUserLoginReq
- (void) didGetMessage:(YPUserLoginRsq*)message
{
    [self doUIOnSuccced:message];
}
@end

