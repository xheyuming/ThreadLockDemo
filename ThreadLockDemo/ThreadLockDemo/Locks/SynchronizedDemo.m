//
//  SynchronizedDemo.m
//  05、OSSpinLock
//
//  Created by  on 2018/11/24.
//  Copyright © 2018 AAAAA. All rights reserved.
//

#import "SynchronizedDemo.h"

@implementation SynchronizedDemo
- (void)__saveMoney{
    @synchronized (self) {        
        [super __saveMoney];
    }
}

- (void)__drawMoney{
    @synchronized (self) {
        [super __drawMoney];
    }
}

- (void)__saleTicket{
    @synchronized (self) {
        [super __saleTicket];
    }
}
@end
