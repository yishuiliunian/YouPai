
#import "YPUserInfo.h"
@implementation YPUserInfo
+ (NSDictionary*) JSONKeyPathsByPropertyKey
{
    return @{@"nickName":@"nickName",
@"phone":@"phone",
@"avatarURL":@"avatarURL",
@"accountType":@"accountType",
@"email":@"email",

            };
}

+ (NSValueTransformer*) nickNameJSONTransformer
{
    return [NSValueTransformer valueTransformerForName:TMDStringValueTransformerName];
}
    

+ (NSValueTransformer*) phoneJSONTransformer
{
    return [NSValueTransformer valueTransformerForName:TMDStringValueTransformerName];
}
    

+ (NSValueTransformer*) avatarURLJSONTransformer
{
    return [NSValueTransformer valueTransformerForName:TMDStringValueTransformerName];
}
    

      + (NSValueTransformer*) accountTypeJSONTransformer
      {
          return [NSValueTransformer valueTransformerForName:TMDInt32ValueTransformerName];
      }
          

+ (NSValueTransformer*) emailJSONTransformer
{
    return [NSValueTransformer valueTransformerForName:TMDStringValueTransformerName];
}
    

- (void) setNilValueForKey:(NSString *)key
{
    if(NO){}
    else if([key isEqualToString:@"accountType"])
	{
	   self.accountType = 0;
	}


}

@end
