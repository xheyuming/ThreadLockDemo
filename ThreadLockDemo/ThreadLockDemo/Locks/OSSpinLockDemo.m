//
//  OSSpinLock.m
//  05、OSSpinLock
//
//  Created by  on 2018/11/23.
//  Copyright © 2018 AAAAA. All rights reserved.
//

#import "OSSpinLockDemo.h"
#import <libkern/OSAtomic.h>

@interface OSSpinLockDemo ()
@property(nonatomic, assign) OSSpinLock moneyLock;
@property(nonatomic, assign) OSSpinLock ticketLock;
@end

@implementation OSSpinLockDemo
- (instancetype)init{
    if (self = [super init]) {
        self.moneyLock = OS_SPINLOCK_INIT;
        self.ticketLock = OS_SPINLOCK_INIT;
    }
    return self;
}

- (void)__saveMoney{
    OSSpinLockLock(&_moneyLock);
    [super __saveMoney];
    OSSpinLockUnlock(&_moneyLock);
}

- (void)__drawMoney{
    OSSpinLockLock(&_moneyLock);
    [super __drawMoney];
    OSSpinLockUnlock(&_moneyLock);
}

- (void)__saleTicket{
    OSSpinLockLock(&_moneyLock);
    [super __saleTicket];
    OSSpinLockUnlock(&_moneyLock);
}
@end
