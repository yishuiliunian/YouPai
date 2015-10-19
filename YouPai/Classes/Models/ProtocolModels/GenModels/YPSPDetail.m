
#import "YPSPDetail.h"
@implementation YPSPDetail
+ (NSDictionary*) JSONKeyPathsByPropertyKey
{
    return @{@"lng":@"lng",
@"spName":@"spName",
@"bzType":@"bzType",
@"memo":@"memo",
@"lnkphone":@"lnkphone",
@"spId":@"spId",
@"lat":@"lat",
@"spTypes":@"spTypes",

            };
}

      + (NSValueTransformer*) lngJSONTransformer
      {
          return [NSValueTransformer valueTransformerForName:TMDDoubleValueTransformerName];
      }
          

+ (NSValueTransformer*) spNameJSONTransformer
{
    return [NSValueTransformer valueTransformerForName:TMDStringValueTransformerName];
}
    

+ (NSValueTransformer*) bzTypeJSONTransformer
{
    return [NSValueTransformer valueTransformerForName:TMDStringValueTransformerName];
}
    

+ (NSValueTransformer*) memoJSONTransformer
{
    return [NSValueTransformer valueTransformerForName:TMDStringValueTransformerName];
}
    

+ (NSValueTransformer*) lnkphoneJSONTransformer
{
    return [NSValueTransformer valueTransformerForName:TMDStringValueTransformerName];
}
    

      + (NSValueTransformer*) spIdJSONTransformer
      {
          return [NSValueTransformer valueTransformerForName:TMDInt32ValueTransformerName];
      }
          

      + (NSValueTransformer*) latJSONTransformer
      {
          return [NSValueTransformer valueTransformerForName:TMDDoubleValueTransformerName];
      }
          
 

    + (NSValueTransformer*) spTypesJSONTransformer  {
      return [NSValueTransformer mtl_arrayMappingTransformerWithTransformer:
                                  [NSValueTransformer mtl_JSONDictionaryTransformerWithModelClass:NSClassFromString(@"YPFindSPTypeDetail")]];
    }
    

- (void) setNilValueForKey:(NSString *)key
{
    if(NO){}
    else if([key isEqualToString:@"lng"])
	{
	   self.lng = 0;
	}

else if([key isEqualToString:@"spId"])
	{
	   self.spId = 0;
	}

else if([key isEqualToString:@"lat"])
	{
	   self.lat = 0;
	}


}

@end
