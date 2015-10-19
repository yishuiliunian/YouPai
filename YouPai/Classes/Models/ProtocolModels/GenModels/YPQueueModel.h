
#import <Mantle.h>
#import "NSValueTransformer+NSString.h"


@interface YPQueueModel : MTLModel <MTLJSONSerializing>
@property(nonatomic,strong) NSString* identifier;

@end
  
