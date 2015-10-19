
#import "MSRequest.h"
#import "YPFindSPRsp.h"
@interface __YPFindSPReq : MSRequest

@property(nonatomic,assign) double lng;

@property(nonatomic,assign) double lat;


- (void) didGetMessage:(YPFindSPRsp*)message;
@end
    
