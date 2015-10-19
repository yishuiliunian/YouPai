
#import "YPSPData.h"
@implementation YPSPData
+ (NSDictionary*) JSONKeyPathsByPropertyKey
{
    return @{@"spId":@"spId",
@"spName":@"spName",
@"lnkphone":@"lnkphone",
@"memo":@"memo",
@"lat":@"lat",
@"lng":@"lng",
@"btype":@"btype",

            };
}

      + (NSValueTransformer*) spIdJSONTransformer
      {
          return [NSValueTransformer valueTransformerForName:TMDInt32ValueTransformerName];
      }
          

+ (NSValueTransformer*) spNameJSONTransformer
{
    return [NSValueTransformer valueTransformerForName:TMDStringValueTransformerName];
}
    

+ (NSValueTransformer*) lnkphoneJSONTransformer
{
    return [NSValueTransformer valueTransformerForName:TMDStringValueTransformerName];
}
    

+ (NSValueTransformer*) memoJSONTransformer
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
          

+ (NSValueTransformer*) btypeJSONTransformer
{
    return [NSValueTransformer valueTransformerForName:TMDStringValueTransformerName];
}
    

- (void) setNilValueForKey:(NSString *)key
{
    if(NO){}
    else if([key isEqualToString:@"spId"])
	{
	   self.spId = 0;
	}

else if([key isEqualToString:@"lat"])
	{
	   self.lat = 0;
	}

else if([key isEqualToString:@"lng"])
	{
	   self.lng = 0;
	}


}

@end
