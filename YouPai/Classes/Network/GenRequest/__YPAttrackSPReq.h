
#import "MSRequest.h"
#import "YPSpSimpleModelList.h"
@interface __YPAttrackSPReq : MSRequest

@property(nonatomic,strong) NSString* userId;


- (void) didGetMessage:(YPSpSimpleModelList*)message;
@end
    
