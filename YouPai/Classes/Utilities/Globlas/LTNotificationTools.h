//
//  LTNotificationTools.h
//  LuTu
//
//  Created by stonedong on 15/5/15.
//  Copyright (c) 2015年 Road.Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#define LTExternObserverMessage(msg) \
void LTAddObserverFor##msg (NSObject* ob, SEL selector);\
void LTRemoveObserverFor##msg (NSObject* ob);\
void LTPost##msg (NSDictionary* dic);\


LTExternObserverMessage(AccountLoad)
LTExternObserverMessage(TabBarOrderSelectIndex)
LTExternObserverMessage(QueueStateChanged)
LTExternObserverMessage(AttrackServiceChanged)