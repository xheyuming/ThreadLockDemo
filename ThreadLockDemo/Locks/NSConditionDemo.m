//
//  NSConditionDemo.m
//  05、OSSpinLock
//
//  Created by  on 2018/11/24.
//  Copyright © 2018 AAAAA. All rights reserved.
//

#import "NSConditionDemo.h"
#import <pthread.h>

@interface NSConditionDemo ()
@property (nonatomic, strong) NSCondition *conditionLock;
@property (nonatomic, strong) NSMutableArray *dataArray;
@end

@implementation NSConditionDemo

- (NSMutableArray *)dataArray{
    if (!_dataArray) {
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}

- (instancetype)init{
    if (self = [super init]) {
        self.conditionLock = [[NSCondition alloc] init];
    }
    return self;
}

- (void)otherTest{
    [[[NSThread alloc] initWithTarget:self selector:@selector(__add) object:nil] start];
    [[[NSThread alloc] initWithTarget:self selector:@selector(__remove) object:nil] start];
}

- (void)__add{
    [self.conditionLock lock];
    [self.dataArray addObject:@"test"];
    NSLog(@"添加了元素");
    
    [self.conditionLock unlock];
}

- (void)__remove{
    [self.conditionLock lock];
    if (self.dataArray.count == 0) {
        [self.conditionLock wait];
    }
    [self.dataArray removeLastObject];
    NSLog(@"删除了元素");
    [self.conditionLock signal];
    [self.conditionLock unlock];
}
@end
