
#import "YPQueueHistoryRecord.h"
@implementation YPQueueHistoryRecord
+ (NSDictionary*) JSONKeyPathsByPropertyKey
{
    return @{@"bzDate":@"bzDate",
@"bzTime":@"bzTime",
@"endTime":@"endTime",
@"fetchTime":@"fetchTime",
@"queueNo":@"queueNo",
@"spId":@"spId",
@"spName":@"spName",
@"spTypeId":@"spTypeId",
@"spTypeName":@"spTypeName",
@"status":@"status",
@"userId":@"userId",
@"userQueueId":@"userQueueId",
@"winId":@"winId",

            };
}

+ (NSValueTransformer*) bzDateJSONTransformer
{
    return [NSValueTransformer valueTransformerForName:TMDStringValueTransformerName];
}
    

+ (NSValueTransformer*) bzTimeJSONTransformer
{
    return [NSValueTransformer valueTransformerForName:TMDStringValueTransformerName];
}
    

+ (NSValueTransformer*) endTimeJSONTransformer
{
    return [NSValueTransformer valueTransformerForName:TMDStringValueTransformerName];
}
    

      + (NSValueTransformer*) fetchTimeJSONTransformer
      {
          return [NSValueTransformer valueTransformerForName:TMDInt64ValueTransformerName];
      }
          

      + (NSValueTransformer*) queueNoJSONTransformer
      {
          return [NSValueTransformer valueTransformerForName:TMDInt32ValueTransformerName];
      }
          

      + (NSValueTransformer*) spIdJSONTransformer
      {
          return [NSValueTransformer valueTransformerForName:TMDInt32ValueTransformerName];
      }
          

+ (NSValueTransformer*) spNameJSONTransformer
{
    return [NSValueTransformer valueTransformerForName:TMDStringValueTransformerName];
}
    

      + (NSValueTransformer*) spTypeIdJSONTransformer
      {
          return [NSValueTransformer valueTransformerForName:TMDInt32ValueTransformerName];
      }
          

+ (NSValueTransformer*) spTypeNameJSONTransformer
{
    return [NSValueTransformer valueTransformerForName:TMDStringValueTransformerName];
}
    

      + (NSValueTransformer*) statusJSONTransformer
      {
          return [NSValueTransformer valueTransformerForName:TMDInt32ValueTransformerName];
      }
          

      + (NSValueTransformer*) userIdJSONTransformer
      {
          return [NSValueTransformer valueTransformerForName:TMDInt32ValueTransformerName];
      }
          

      + (NSValueTransformer*) userQueueIdJSONTransformer
      {
          return [NSValueTransformer valueTransformerForName:TMDInt32ValueTransformerName];
      }
          

      + (NSValueTransformer*) winIdJSONTransformer
      {
          return [NSValueTransformer valueTransformerForName:TMDInt32ValueTransformerName];
      }
          

- (void) setNilValueForKey:(NSString *)key
{
    if(NO){}
    else if([key isEqualToString:@"fetchTime"])
	{
	   self.fetchTime = 0;
	}

else if([key isEqualToString:@"queueNo"])
	{
	   self.queueNo = 0;
	}

else if([key isEqualToString:@"spId"])
	{
	   self.spId = 0;
	}

else if([key isEqualToString:@"spTypeId"])
	{
	   self.spTypeId = 0;
	}

else if([key isEqualToString:@"status"])
	{
	   self.status = 0;
	}

else if([key isEqualToString:@"userId"])
	{
	   self.userId = 0;
	}

else if([key isEqualToString:@"userQueueId"])
	{
	   self.userQueueId = 0;
	}

else if([key isEqualToString:@"winId"])
	{
	   self.winId = 0;
	}


}

@end
