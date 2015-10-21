
#import <Mantle.h>
#import "NSValueTransformer+NSString.h"

#import "NSValueTransformer+NSString.h"

#import "YPUserInfo.h" 


@interface LTAccount : MTLModel <MTLJSONSerializing>
@property(nonatomic,strong) NSString* userID;
@property(nonatomic,strong) NSString* token;
@property(nonatomic,strong) YPUserInfo* userInfo;

@end
  
