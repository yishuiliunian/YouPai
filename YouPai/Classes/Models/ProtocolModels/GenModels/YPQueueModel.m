
#import "YPQueueModel.h"
@implementation YPQueueModel
+ (NSDictionary*) JSONKeyPathsByPropertyKey
{
    return @{@"identifier":@"identifier",

            };
}

+ (NSValueTransformer*) identifierJSONTransformer
{
    return [NSValueTransformer valueTransformerForName:TMDStringValueTransformerName];
}
    

- (void) setNilValueForKey:(NSString *)key
{
    if(NO){}
    
}

@end
