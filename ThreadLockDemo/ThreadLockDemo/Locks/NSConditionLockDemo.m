//
//  NSConditionLockDemo.m
//  05、OSSpinLock
//
//  Created by  on 2018/11/24.
//  Copyright © 2018 AAAAA. All rights reserved.
//

#import "NSConditionLockDemo.h"
#import <pthread.h>

@interface NSConditionLockDemo ()
@property (nonatomic, strong) NSConditionLock *conditionLock;
@end

@implementation NSConditionLockDemo

- (instancetype)init{
    if (self = [super init]) {
        self.conditionLock = [[NSConditionLock  alloc] initWithCondition:1];
    }
    return self;
}

- (void)otherTest{
    [[[NSThread alloc] initWithTarget:self selector:@selector(__one) object:nil] start];
    [[[NSThread alloc] initWithTarget:self selector:@selector(__two) object:nil] start];
}

- (void)__one{
    [self.conditionLock lockWhenCondition:1];
    NSLog(@"添加了元素");
    [self.conditionLock unlockWithCondition:2];
}

- (void)__two{
    [self.conditionLock lockWhenCondition:2];
    NSLog(@"删除了元素");
    [self.conditionLock unlock];
}
@end
