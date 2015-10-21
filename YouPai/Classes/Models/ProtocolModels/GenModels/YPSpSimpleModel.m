
#import "YPSpSimpleModel.h"
@implementation YPSpSimpleModel
+ (NSDictionary*) JSONKeyPathsByPropertyKey
{
    return @{@"bzType":@"bzType",
@"lat":@"lat",
@"lng":@"lng",
@"lnkphone":@"lnkphone",
@"memo":@"memo",
@"spId":@"spId",
@"spName":@"spName",

            };
}

+ (NSValueTransformer*) bzTypeJSONTransformer
{
    return [NSValueTransformer valueTransformerForName:TMDStringValueTransformerName];
}
    

      + (NSValueTransformer*) latJSONTransformer
      {
          return [NSValueTransformer valueTransformerForName:TMDDoubleValueTransformerName];
      }
          

      + (NSValueTransformer*) lngJSONTransformer
      {
          return [NSValueTransformer valueTransformerForName:TMDDoubleValueTransformerName];
      }
          

+ (NSValueTransformer*) lnkphoneJSONTransformer
{
    return [NSValueTransformer valueTransformerForName:TMDStringValueTransformerName];
}
    

+ (NSValueTransformer*) memoJSONTransformer
{
    return [NSValueTransformer valueTransformerForName:TMDStringValueTransformerName];
}
    

      + (NSValueTransformer*) spIdJSONTransformer
      {
          return [NSValueTransformer valueTransformerForName:TMDInt32ValueTransformerName];
      }
          

+ (NSValueTransformer*) spNameJSONTransformer
{
    return [NSValueTransformer valueTransformerForName:TMDStringValueTransformerName];
}
    

- (void) setNilValueForKey:(NSString *)key
{
    if(NO){}
    else if([key isEqualToString:@"lat"])
	{
	   self.lat = 0;
	}

else if([key isEqualToString:@"lng"])
	{
	   self.lng = 0;
	}

else if([key isEqualToString:@"spId"])
	{
	   self.spId = 0;
	}


}

@end
