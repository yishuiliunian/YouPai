
#import "YPAttrackSPReq.h"
#import "YPService.h"
#import "DZNormalLayout.h"
@implementation YPAttrackSPReq
- (void) didGetMessage:(YPSpSimpleModelList*)message
{
    NSMutableArray* services = [NSMutableArray new];
    NSMutableArray* layouts = [NSMutableArray new];
    for (YPSpSimpleModel* m in message.list) {
        YPService* s = [[YPService alloc] initWithServerData:m];
        if (s) {
            [services addObject:s];
        }
        
        DZNormalLayout* layout = [DZNormalLayout new];
        layout.title = s.name;
        layout.content = s.addressName;
        layout.imageURL = s.headerURL;
        layout.dataObject = s;
        [layouts addObject:layout];
    }
    
    [self doUIOnSuccced:layouts];
}
@end

