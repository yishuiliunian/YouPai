//
//  YPActionLayout.h
//  YouPai
//
//  Created by stonedong on 15/9/9.
//  Copyright (c) 2015年 stonedong. All rights reserved.
//

#import "DZLayout.h"

@interface YPActionLayout : DZLayout
@property (nonatomic, strong)UIImage* image;
@property (nonatomic, strong) NSString* title;

- (instancetype) initWithImage:(UIImage*)image title:(NSString*)title;
@end
