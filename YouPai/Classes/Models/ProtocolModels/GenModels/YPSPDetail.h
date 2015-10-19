
#import <Mantle.h>
#import "NSValueTransformer+NSString.h"

#import "NSValueTransformer+NSString.h"

#import "NSValueTransformer+NSString.h"

#import "NSValueTransformer+NSString.h"

#import "YPFindSPTypeDetail.h" 


@interface YPSPDetail : MTLModel <MTLJSONSerializing>
@property(nonatomic,assign) double lng;
@property(nonatomic,strong) NSString* spName;
@property(nonatomic,strong) NSString* bzType;
@property(nonatomic,strong) NSString* memo;
@property(nonatomic,strong) NSString* lnkphone;
@property(nonatomic,assign) int32_t spId;
@property(nonatomic,assign) double lat;
@property(nonatomic,strong) NSArray* spTypes;

@end
  
