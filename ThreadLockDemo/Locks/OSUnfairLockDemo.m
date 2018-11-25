//
//  OSUnfairLockDemo.m
//  05、OSSpinLock
//
//  Created by  on 2018/11/23.
//  Copyright © 2018 AAAAA. All rights reserved.
//

#import "OSUnfairLockDemo.h"
#import <libkern/OSAtomic.h>
#import <os/lock.h>

@interface OSUnfairLockDemo ()
@property (nonatomic,  assign) os_unfair_lock moneyLock;
@property (nonatomic,  assign) os_unfair_lock ticketLock;
@end

@implementation OSUnfairLockDemo

- (instancetype)init{
    if (self == [super init]) {
        self.moneyLock = OS_UNFAIR_LOCK_INIT;
    }
    return self;
}
- (void)__saveMoney{
    os_unfair_lock_lock(&_moneyLock);
    [super __saveMoney];
    os_unfair_lock_unlock(&_moneyLock);
}

- (void)__saleTicket{
    os_unfair_lock_lock(&_ticketLock);
    [super __saleTicket];
    os_unfair_lock_unlock(&_ticketLock);
}

- (void)__drawMoney{
    os_unfair_lock_lock(&_ticketLock);
    [super __drawMoney];
    os_unfair_lock_unlock(&_ticketLock);
}
@end
