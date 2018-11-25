//
//  MutexDemo3.m
//  05、OSSpinLock
//
//  Created by  on 2018/11/24.
//  Copyright © 2018 AAAAA. All rights reserved.
//

#import "MutexDemo3.h"
#import <pthread.h>

@interface MutexDemo3 ()
@property (nonatomic, assign) pthread_mutex_t moneyMutex;
@property (nonatomic, assign) pthread_cond_t cond;
@property (nonatomic, assign) pthread_mutex_t testMutex;
@property (nonatomic, strong) NSMutableArray *dataArray;
@end

@implementation MutexDemo3

- (NSMutableArray *)dataArray{
    if (!_dataArray) {
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}

- (instancetype)init{
    if (self = [super init]) {
        //        self.mutex = PTHREAD_MUTEX_INITIALIZER;
        pthread_mutexattr_t attr;
        pthread_mutexattr_init(&attr);
        pthread_mutexattr_settype(&attr, PTHREAD_MUTEX_DEFAULT);
        //    pthread_mutexattr_settype(&attr, PTHREAD_MUTEX_RECURSIVE);
        pthread_cond_init(&_cond, nil);
        pthread_mutex_init(&_testMutex, &attr);
        pthread_mutexattr_destroy(&attr);
    }
    return self;
}

- (void)otherTest{
    [[[NSThread alloc] initWithTarget:self selector:@selector(__add) object:nil] start];
    [[[NSThread alloc] initWithTarget:self selector:@selector(__remove) object:nil] start];
}

- (void)__add{
    pthread_mutex_lock(&_testMutex);
    [self.dataArray addObject:@"test"];
    NSLog(@"添加了元素");
    pthread_cond_signal(&_cond);
    pthread_mutex_unlock(&_testMutex);
}

- (void)__remove{
    pthread_mutex_lock(&_testMutex);
    if (self.dataArray.count == 0) {
        pthread_cond_wait(&_cond, &_testMutex);
    }
    [self.dataArray removeLastObject];
    NSLog(@"删除了元素");
    pthread_mutex_unlock(&_testMutex);
}

- (void)dealloc{
    pthread_mutex_destroy(&_testMutex);
    pthread_cond_destroy(&_cond);
}

@end
