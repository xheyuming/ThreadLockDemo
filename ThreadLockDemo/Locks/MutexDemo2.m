//
//  MutexDemo2.m
//  05、OSSpinLock
//
//  Created by  on 2018/11/24.
//  Copyright © 2018 AAAAA. All rights reserved.
//

#import "MutexDemo2.h"
#import <pthread.h>

@interface MutexDemo2 ()
@property (nonatomic, assign) pthread_mutex_t moneyMutex;
@property (nonatomic, assign) pthread_mutex_t ticketMutex;
@property (nonatomic, assign) pthread_mutex_t testMutex;
@end

@implementation MutexDemo2

- (void)__initMutex:(pthread_mutex_t *)mutex{
    pthread_mutexattr_t attr;
    pthread_mutexattr_init(&attr);
    pthread_mutexattr_settype(&attr, PTHREAD_MUTEX_DEFAULT);
//    pthread_mutexattr_settype(&attr, PTHREAD_MUTEX_RECURSIVE);
    pthread_mutex_init(mutex, &attr);
    pthread_mutexattr_destroy(&attr);
}

- (instancetype)init{
    if (self = [super init]) {
        //        self.mutex = PTHREAD_MUTEX_INITIALIZER;
        [self __initMutex:&_moneyMutex];
        [self __initMutex:&_ticketMutex];
        [self __initMutex:&_testMutex];
    }
    return self;
}

- (void)otherTest{
    pthread_mutex_lock(&_testMutex);
    NSLog(@"%s",__func__);
    [self otherTest];
    pthread_mutex_unlock(&_testMutex);
}

- (void)otherTest2{
    pthread_mutex_lock(&_testMutex);
    [self otherTest2];
    pthread_mutex_unlock(&_testMutex);
}

- (void)__saveMoney{
    pthread_mutex_lock(&_moneyMutex);
    [super __saveMoney];
    pthread_mutex_unlock(&_moneyMutex);
}

- (void)__drawMoney{
    pthread_mutex_lock(&_moneyMutex);
    [super __drawMoney];
    pthread_mutex_unlock(&_moneyMutex);
}

- (void)__saleTicket{
    pthread_mutex_lock(&_ticketMutex);
    [super __saleTicket];
    pthread_mutex_unlock(&_ticketMutex);
}
@end
