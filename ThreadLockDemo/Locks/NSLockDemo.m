//
//  NSLockDemo.m
//  05、OSSpinLock
//
//  Created by  on 2018/11/24.
//  Copyright © 2018 AAAAA. All rights reserved.
//

#import "NSLockDemo.h"
#import <pthread.h>

@interface NSLockDemo ()
@property (nonatomic, strong) NSLock *moneyLock;
@property (nonatomic, strong) NSLock *ticketLock;
@end

@implementation NSLockDemo


- (instancetype)init{
    if (self = [super init]) {
        //        self.mutex = PTHREAD_MUTEX_INITIALIZER;
        self.moneyLock = [[NSLock alloc] init];
        self.ticketLock = [[NSLock alloc] init];
    }
    return self;
}

- (void)otherTest{
    NSLog(@"%s",__func__);
    [self otherTest];
}

- (void)otherTest2{

}

- (void)__saveMoney{
    [self.moneyLock lock];
    [super __saveMoney];
    [self.moneyLock unlock];
}

- (void)__drawMoney{
    [self.ticketLock lock];
    [super __drawMoney];
    [self.ticketLock unlock];
}

- (void)__saleTicket{
    [self.ticketLock lock];
    [super __saleTicket];
    [self.ticketLock unlock];
}
@end
