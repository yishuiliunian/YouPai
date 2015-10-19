
#import "YPUserLoginRsq.h"
@implementation YPUserLoginRsq
+ (NSDictionary*) JSONKeyPathsByPropertyKey
{
    return @{@"uname":@"uname",
@"accountType":@"accountType",
@"mobile":@"mobile",
@"userId":@"userId",
@"email":@"email",
@"token":@"token",

            };
}

+ (NSValueTransformer*) unameJSONTransformer
{
    return [NSValueTransformer valueTransformerForName:TMDStringValueTransformerName];
}
    

      + (NSValueTransformer*) accountTypeJSONTransformer
      {
          return [NSValueTransformer valueTransformerForName:TMDInt32ValueTransformerName];
      }
          

+ (NSValueTransformer*) mobileJSONTransformer
{
    return [NSValueTransformer valueTransformerForName:TMDStringValueTransformerName];
}
    

      + (NSValueTransformer*) userIdJSONTransformer
      {
          return [NSValueTransformer valueTransformerForName:TMDInt32ValueTransformerName];
      }
          

+ (NSValueTransformer*) emailJSONTransformer
{
    return [NSValueTransformer valueTransformerForName:TMDStringValueTransformerName];
}
    

+ (NSValueTransformer*) tokenJSONTransformer
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

else if([key isEqualToString:@"userId"])
	{
	   self.userId = 0;
	}


}

@end
