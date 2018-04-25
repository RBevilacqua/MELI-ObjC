//
//  InstallmentViewModel.m
//  PruebaMELI
//
//  Created by Robert Bevilacqua on 23/4/18.
//  Copyright © 2018 Robert Bevilacqua. All rights reserved.
//

#import "InstallmentViewModel.h"

@implementation InstallmentViewModel


- (instancetype)init
{
    self = [super init];
    if (self) {
        self.installments = [NSMutableArray new];
    }
    return self;
}

- (void)getInstallmentsWithPayment:(NSString *)paymentId issuer:(NSString *)issuerId amount:(float)amount callback:(void (^)(NSArray<Installments *> * _Nullable, NSURLSessionDataTask * _Nullable, NSError * _Nullable))callback {
    
    NSDictionary *params = @{
                             @"public_key": [[ServicesManager getParams] valueForKey:@"public_key"],
                             @"payment_method_id": paymentId,
                             @"issuer.id": issuerId,
                             @"amount": [@(amount) stringValue]
                             };
    
    [ServicesManager requestJSONWithPath:@"installments" method:@"GET" params:params headers:nil callback:^(NSURLSessionDataTask * _Nonnull task, id _Nullable responseObject, NSError * _Nullable error) {
        
        if (error != nil) {
            callback(nil, task, error);
            return;
        }
        
        NSArray *data = (NSArray *)responseObject;
        
        if ([data count] > 0) {
            for (NSDictionary *objc in data) {
                Installments * objMapped = [Installments installmentWithDictionary:objc];
                [self.installments addObject:objMapped];
                
            }
            
            callback(self.installments, task, nil);
            
        } else {
            callback(self.installments, task, nil);
            return;
        }
        
    }];
}

@end
