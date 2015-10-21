
#import "YPHistoryReq.h"
#import "YPQueueHistoryRecord.h"
#import "YPThirdLineLayout.h"
@implementation YPHistoryReq
- (void) didGetMessage:(YPQueueHistoryRecordList*)message
{
    NSMutableArray* array = [NSMutableArray new];
    for (int i = 0; i < 20; i++) {
        YPThirdLineLayout* layout = [YPThirdLineLayout new];
        layout.imageURL = @"";
        layout.topText = @"xxxxx dfasdfasdf";
        layout.centerText = @"西城区地税听";
        layout.bottomText = @"耗时2个小时";
        [array addObject:layout];
    }
    
    [self doUIOnSuccced:array];

}
@end

