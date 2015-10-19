
#import "MSRequest.h"
#import "YPSPDetail.h"
@interface __YPSPDetailReq : MSRequest

@property(nonatomic,assign) double lng;

@property(nonatomic,assign) double lat;


- (void) didGetMessage:(YPSPDetail*)message;
@end
    
