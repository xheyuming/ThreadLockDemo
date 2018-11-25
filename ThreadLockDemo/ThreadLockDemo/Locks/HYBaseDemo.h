//
//  HYBaseDemo.h
//  05、OSSpinLock
//
//  Created by  on 2018/11/23.
//  Copyright © 2018 AAAAA. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface HYBaseDemo : NSObject
- (void)moneyTest;
- (void)ticketsTest;
- (void)otherTest;

- (void)__saveMoney;
- (void)__drawMoney;

- (void)__saleTicket;
@end

NS_ASSUME_NONNULL_END
