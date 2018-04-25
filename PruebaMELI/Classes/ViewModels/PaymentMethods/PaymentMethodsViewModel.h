//
//  PaymentMethodsViewModel.h
//  PruebaMELI
//
//  Created by Robert Bevilacqua on 19/4/18.
//  Copyright © 2018 Robert Bevilacqua. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PaymentMethods.h"
#import "ServicesManager.h"

@interface PaymentMethodsViewModel : NSObject

@property (nonatomic, nullable) NSMutableArray<PaymentMethods *> * paymentMethods;

- (void)getPaymentMethods:(void(^)(NSArray<PaymentMethods *> * _Nullable, NSURLSessionDataTask * _Nullable, NSError * _Nullable error))callback;

@end
