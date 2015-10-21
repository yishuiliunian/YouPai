
#import "MSRequest.h"
#import "YPNullModel.h"
@interface __YPAddAttrackReq : MSRequest

@property(nonatomic,strong) NSString* userId;

@property(nonatomic,strong) NSString* spId;


- (void) didGetMessage:(YPNullModel*)message;
@end
    
