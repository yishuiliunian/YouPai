
#import "MSRequest.h"
#import "YPUserLoginRsq.h"
@interface __YPUserLoginReq : MSRequest

@property(nonatomic,strong) NSString* uname;

@property(nonatomic,strong) NSString* passwd;


- (void) didGetMessage:(YPUserLoginRsq*)message;
@end
    
