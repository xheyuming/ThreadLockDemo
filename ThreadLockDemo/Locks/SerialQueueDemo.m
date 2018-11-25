//
//  SerialQueue.m
//  05、OSSpinLock
//
//  Created by  on 2018/11/24.
//  Copyright © 2018 AAAAA. All rights reserved.
//

#import "SerialQueueDemo.h"
#import <pthread.h>

@interface SerialQueueDemo ()
@property (nonatomic, strong) dispatch_queue_t ticketQueue;
@property (nonatomic, strong) dispatch_queue_t moneyQueue;
@end

@implementation SerialQueueDemo



- (instancetype)init{
    if (self = [super init]) {
        self.ticketQueue = dispatch_queue_create("ticketQueue", DISPATCH_QUEUE_SERIAL);
        self.moneyQueue = dispatch_queue_create("moneyQueue", DISPATCH_QUEUE_SERIAL);
    }
    return self;
}

- (void)__saveMoney{
    dispatch_sync(self.ticketQueue, ^{
        [super __saveMoney];
    });
}

- (void)__drawMoney{
    dispatch_sync(self.ticketQueue, ^{
        [super __drawMoney];
    });
}

- (void)__saleTicket{
    dispatch_sync(self.ticketQueue, ^{
        [super __saleTicket];
    });
}
@end
