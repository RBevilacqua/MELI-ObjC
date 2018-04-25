//
//  PayerCost.m
//  PruebaMELI
//
//  Created by Robert Bevilacqua on 19/4/18.
//  Copyright © 2018 Robert Bevilacqua. All rights reserved.
//

#import "PayerCost.h"

@implementation PayerCost

+ (instancetype)payerWithDictionary:(NSDictionary *)objc {
    
    PayerCost * payer = [[PayerCost alloc] init];
    
    payer.installments = [[objc valueForKey:@"installments"] floatValue];
    payer.installmentRate = [[objc valueForKey:@"installment_rate"] floatValue];
    payer.discountRate = [[objc valueForKey:@"discount_rate"] floatValue];
    payer.minAllowedAmount = [[objc valueForKey:@"min_allowed_amount"] floatValue];
    payer.maxAllowedAmount = [[objc valueForKey:@"max_allowed_amount"] floatValue];
    payer.installmentAmount = [[objc valueForKey:@"installment_amount"] floatValue];
    payer.totalAmount = [[objc valueForKey:@"total_amount"] floatValue];
    payer.recommendedMessage = [objc valueForKey:@"recommended_message"];
    payer.installmentRateCollector = [objc valueForKey:@"installment_rate_collector"];
    payer.labels = [objc valueForKey:@"merchant_account_id"];
    
    return payer;
}

@end
