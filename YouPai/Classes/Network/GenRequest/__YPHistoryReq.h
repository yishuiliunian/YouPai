
#import "MSRequest.h"
#import "YPQueueHistoryRecordList.h"
@interface __YPHistoryReq : MSRequest

@property(nonatomic,strong) NSString* userId;

@property(nonatomic,strong) NSString* startDate;

@property(nonatomic,strong) NSString* endDate;

@property(nonatomic,assign) int32_t status;


- (void) didGetMessage:(YPQueueHistoryRecordList*)message;
@end
    
