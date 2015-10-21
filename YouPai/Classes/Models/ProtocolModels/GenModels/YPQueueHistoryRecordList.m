
#import "YPQueueHistoryRecordList.h"
@implementation YPQueueHistoryRecordList
+ (NSDictionary*) JSONKeyPathsByPropertyKey
{
    return @{@"list":@"list",

            };
}
 

    + (NSValueTransformer*) listJSONTransformer  {
      return [NSValueTransformer mtl_arrayMappingTransformerWithTransformer:
                                  [NSValueTransformer mtl_JSONDictionaryTransformerWithModelClass:NSClassFromString(@"YPQueueHistoryRecord")]];
    }
    

- (void) setNilValueForKey:(NSString *)key
{
    if(NO){}
    
}

@end
