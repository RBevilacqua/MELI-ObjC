//
//  PaymentMethodsViewModel.m
//  PruebaMELI
//
//  Created by Robert Bevilacqua on 19/4/18.
//  Copyright © 2018 Robert Bevilacqua. All rights reserved.
//

#import "PaymentMethodsViewModel.h"

@implementation PaymentMethodsViewModel

- (void)getPaymentMethods:(void (^)(NSArray<PaymentMethods *> * _Nullable, NSURLSessionDataTask * _Nullable, NSError * _Nullable))callback {
    
    [ServicesManager requestJSONWithPath:nil method:@"GET" params:[ServicesManager getParams] headers:nil callback:^(NSURLSessionDataTask * _Nonnull task, id _Nullable responseObject, NSError * _Nullable error) {
        
        self.paymentMethods = [NSMutableArray new];
        
        if (error != nil) {
            callback(nil, task, error);
            return;
        }
        
        NSArray *data = (NSArray *)responseObject;
        
        if ([data count] > 0) {
            for (NSDictionary *objc in data) {
                PaymentMethods * objMapped = [PaymentMethods paymentMethodsWithDictionary:objc];
                [self.paymentMethods addObject:objMapped];
                
            }
            
            callback(self.paymentMethods, task, nil);
            
        } else {
            callback(self.paymentMethods, task, nil);
            return;
        }
        
    }];
}

@end
