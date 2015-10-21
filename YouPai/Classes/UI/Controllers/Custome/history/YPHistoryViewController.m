//
//  YPHistoryViewController.m
//  YouPai
//
//  Created by stonedong on 15/10/21.
//  Copyright © 2015年 stonedong. All rights reserved.
//

#import "YPHistoryViewController.h"

@implementation YPHistoryViewController

- (void) viewDidLoad
{
    [super viewDidLoad];
    [self.dataSyncer reloadData];
}

@end
