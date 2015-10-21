//
//  DZTableNetwrokDataSync.h
//  YouPai
//
//  Created by stonedong on 15/10/21.
//  Copyright © 2015年 stonedong. All rights reserved.
//

#import "DZTableDataSync.h"
#import "MSRequest.h"
@interface DZTableNetwrokDataSync : DZTableDataSync <MSRequestUIDelegate>
- (MSRequest*) request;
@end
