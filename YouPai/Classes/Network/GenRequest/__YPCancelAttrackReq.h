
#import "MSRequest.h"
#import "YPNullModel.h"
@interface __YPCancelAttrackReq : MSRequest

@property(nonatomic,strong) NSString* userId;

@property(nonatomic,strong) NSString* spId;


- (void) didGetMessage:(YPNullModel*)message;
@end
    
