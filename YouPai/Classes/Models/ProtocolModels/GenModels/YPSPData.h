
#import <Mantle.h>
#import "NSValueTransformer+NSString.h"

#import "NSValueTransformer+NSString.h"

#import "NSValueTransformer+NSString.h"

#import "NSValueTransformer+NSString.h"


@interface YPSPData : MTLModel <MTLJSONSerializing>
@property(nonatomic,assign) int32_t spId;
@property(nonatomic,strong) NSString* spName;
@property(nonatomic,strong) NSString* lnkphone;
@property(nonatomic,strong) NSString* memo;
@property(nonatomic,assign) double lat;
@property(nonatomic,assign) double lng;
@property(nonatomic,strong) NSString* btype;

@end
  
