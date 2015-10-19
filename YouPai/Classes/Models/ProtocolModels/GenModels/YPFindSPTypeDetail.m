
#import "YPFindSPTypeDetail.h"
@implementation YPFindSPTypeDetail
+ (NSDictionary*) JSONKeyPathsByPropertyKey
{
    return @{@"momo":@"momo",
@"spTypeName":@"spTypeName",
@"spId":@"spId",
@"spTypeId":@"spTypeId",

            };
}

+ (NSValueTransformer*) momoJSONTransformer
{
    return [NSValueTransformer valueTransformerForName:TMDStringValueTransformerName];
}
    

+ (NSValueTransformer*) spTypeNameJSONTransformer
{
    return [NSValueTransformer valueTransformerForName:TMDStringValueTransformerName];
}
    

      + (NSValueTransformer*) spIdJSONTransformer
      {
          return [NSValueTransformer valueTransformerForName:TMDInt32ValueTransformerName];
      }
          

      + (NSValueTransformer*) spTypeIdJSONTransformer
      {
          return [NSValueTransformer valueTransformerForName:TMDInt32ValueTransformerName];
      }
          

- (void) setNilValueForKey:(NSString *)key
{
    if(NO){}
    else if([key isEqualToString:@"spId"])
	{
	   self.spId = 0;
	}

else if([key isEqualToString:@"spTypeId"])
	{
	   self.spTypeId = 0;
	}


}

@end
