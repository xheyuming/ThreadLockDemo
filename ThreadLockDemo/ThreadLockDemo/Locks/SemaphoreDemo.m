//
//  SemaphoreDemo.m
//  05、OSSpinLock
//
//  Created by  on 2018/11/24.
//  Copyright © 2018 AAAAA. All rights reserved.
//

#import "SemaphoreDemo.h"

@interface SemaphoreDemo ()
@property (nonatomic, strong) dispatch_semaphore_t  semaphore;
@end

@implementation SemaphoreDemo

- (instancetype)init{
    if (self = [super init]) {
        self.semaphore = dispatch_semaphore_create(2);
    }
    return self;
}

- (void)otherTest{
    for (int i=0; i<20; i++) {
        [[[NSThread alloc] initWithTarget:self selector:@selector(test) object:nil] start];
    }
}

- (void)test{
    dispatch_semaphore_wait(self.semaphore, DISPATCH_TIME_FOREVER);
    sleep(2);
    NSLog(@"%@",[NSThread currentThread]);
    dispatch_semaphore_signal(self.semaphore);
}
@end
