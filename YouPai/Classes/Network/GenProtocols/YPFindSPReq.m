
#import "YPFindSPReq.h"
#import "DZNormalLayout.h"
#import "YPService.h"
@implementation YPFindSPReq
- (void) didGetMessage:(YPFindSPRsp*)message
{
    
    NSMutableArray* list = [NSMutableArray new];
    for (YPSpSimpleModel* sm in message.list) {
        YPService* service = [[YPService alloc] initWithServerData:sm];
        
        DZNormalLayout* layout = [DZNormalLayout new];
        layout.imageURL = @"";
        layout.title    = service.name;
        layout.content  = service.addressName;
        
        layout.dataObject = service;
        [list addObject:layout];
    }
    [self doUIOnSuccced:list];
}


@end

