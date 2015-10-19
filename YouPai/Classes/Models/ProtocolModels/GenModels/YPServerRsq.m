
#import "YPServerRsq.h"
@implementation YPServerRsq
+ (NSDictionary*) JSONKeyPathsByPropertyKey
{
    return @{@"code":@"code",
@"data":@"data",
@"engMessage":@"engMessage",
@"message":@"message",
@"timestamp":@"timestamp",
@"version":@"version",

            };
}

      + (NSValueTransformer*) codeJSONTransformer
      {
          return [NSValueTransformer valueTransformerForName:TMDInt32ValueTransformerName];
      }
          

+ (NSValueTransformer*) dataJSONTransformer
{
   return [NSValueTransformer mtl_validatingTransformerForClass:NSClassFromString(@"NSObject")];
}


+ (NSValueTransformer*) engMessageJSONTransformer
{
    return [NSValueTransformer valueTransformerForName:TMDStringValueTransformerName];
}
    

+ (NSValueTransformer*) messageJSONTransformer
{
    return [NSValueTransformer valueTransformerForName:TMDStringValueTransformerName];
}
    

      + (NSValueTransformer*) timestampJSONTransformer
      {
          return [NSValueTransformer valueTransformerForName:TMDInt64ValueTransformerName];
      }
          

+ (NSValueTransformer*) versionJSONTransformer
{
    return [NSValueTransformer valueTransformerForName:TMDStringValueTransformerName];
}
    

- (void) setNilValueForKey:(NSString *)key
{
    if(NO){}
    else if([key isEqualToString:@"code"])
	{
	   self.code = 0;
	}

else if([key isEqualToString:@"timestamp"])
	{
	   self.timestamp = 0;
	}


}

@end
