
#import "YPFindSPRsp.h"
@implementation YPFindSPRsp
+ (NSDictionary*) JSONKeyPathsByPropertyKey
{
    return @{@"list":@"list",

            };
}
 

    + (NSValueTransformer*) listJSONTransformer  {
      return [NSValueTransformer mtl_arrayMappingTransformerWithTransformer:
                                  [NSValueTransformer mtl_JSONDictionaryTransformerWithModelClass:NSClassFromString(@"YPSpSimpleModel")]];
    }
    

- (void) setNilValueForKey:(NSString *)key
{
    if(NO){}
    
}

@end
