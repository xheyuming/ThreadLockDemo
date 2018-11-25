//
//  ViewController.m
//  ThreadLockDemo
//
//  Created by  on 2018/11/25.
//  Copyright © 2018 AAAAA. All rights reserved.
//

#import "ViewController.h"
#import "OSSpinLockDemo.h"
#import "OSUnfairLockDemo.h"
#import "MutexDemo.h"
#import "MutexDemo2.h"
#import "MutexDemo3.h"
#import "NSLockDemo.h"
#import "NSConditionDemo.h"
#import "NSConditionLockDemo.h"
#import "SerialQueueDemo.h"
#import "SemaphoreDemo.h"
#import "SynchronizedDemo.h"

@interface ViewController ()
@property (nonatomic, strong) HYBaseDemo *demo;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //    self.demo = [[OSSpinLockDemo alloc] init];
    
    //    self.demo = [[OSUnfairLockDemo alloc] init];
    
    //     self.demo = [[MutexDemo alloc] init];
    //    self.demo = [[NSLockDemo alloc] init];
    //     self.demo = [[NSConditionDemo alloc] init];
    //    self.demo = [[NSConditionLockDemo alloc] init];
    //    self.demo = [[SerialQueueDemo alloc] init];
    //    self.demo = [[SemaphoreDemo alloc] init];
    self.demo = [[SynchronizedDemo alloc] init];
    //    [self.demo otherTest];
    
    [self.demo ticketsTest];
    [self.demo moneyTest];
}
@end
