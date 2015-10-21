
#import "LTAccount.h"
@implementation LTAccount
+ (NSDictionary*) JSONKeyPathsByPropertyKey
{
    return @{@"userID":@"userID",
@"token":@"token",
@"userInfo":@"userInfo",

            };
}

+ (NSValueTransformer*) userIDJSONTransformer
{
    return [NSValueTransformer valueTransformerForName:TMDStringValueTransformerName];
}
    

+ (NSValueTransformer*) tokenJSONTransformer
{
    return [NSValueTransformer valueTransformerForName:TMDStringValueTransformerName];
}
    

+ (NSValueTransformer*) userInfoJSONTransformer
{
   return [NSValueTransformer mtl_validatingTransformerForClass:NSClassFromString(@"YPUserInfo")];
}


- (void) setNilValueForKey:(NSString *)key
{
    if(NO){}
    
}

@end
