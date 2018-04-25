//
//  IssuerViewModel.m
//  PruebaMELI
//
//  Created by Robert Bevilacqua on 23/4/18.
//  Copyright © 2018 Robert Bevilacqua. All rights reserved.
//

#import "IssuerViewModel.h"

@implementation IssuerViewModel

- (void)getIssuerWithPayment:(NSString *)paymentId callback:(void (^)(NSArray<IssuerCard *> * _Nullable, NSURLSessionDataTask * _Nullable, NSError * _Nullable))callback {
    
    NSDictionary *params = @{
                             @"public_key": [[ServicesManager getParams] valueForKey:@"public_key"],
                             @"payment_method_id": paymentId
    };
    
    [ServicesManager requestJSONWithPath:@"card_issuers" method:@"GET" params:params headers:nil callback:^(NSURLSessionDataTask * _Nonnull task, id _Nullable responseObject, NSError * _Nullable error) {
        
        self.issuer = [NSMutableArray new];
        
        if (error != nil) {
            callback(nil, task, error);
            return;
        }
        
        NSArray *data = (NSArray *)responseObject;
        
        if ([data count] > 0) {
            for (NSDictionary *objc in data) {
                IssuerCard * objMapped = [IssuerCard issuerWithDictionary:objc];
                [self.issuer addObject:objMapped];
                
            }
            
            callback(self.issuer, task, nil);
            
        } else {
            callback(self.issuer, task, nil);
            return;
        }
        
    }];
}

@end
