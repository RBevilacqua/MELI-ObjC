//
//  Installments.m
//  PruebaMELI
//
//  Created by Robert Bevilacqua on 19/4/18.
//  Copyright © 2018 Robert Bevilacqua. All rights reserved.
//

#import "Installments.h"

@implementation Installments

+ (instancetype)installmentWithDictionary:(NSDictionary *)objc {
    Installments * installment = [[Installments alloc] init];
    
    installment.paymentMethodId = [objc valueForKey:@"payment_method_id"];
    installment.paymentTypeId = [objc valueForKey:@"payment_type_id"];
    installment.processingMode = [objc valueForKey:@"processing_mode"];
    installment.merchantAccountId = [objc valueForKey:@"merchant_account_id"];

    installment.issuer = [IssuerCard issuerWithDictionary:[objc valueForKey:@"issuer"]];
    
    NSArray * payers = [objc valueForKey:@"payer_costs"];
    NSMutableArray<PayerCost *> * payersArray = [[NSMutableArray alloc] init];
    
    for (NSDictionary *payer in payers) {
        [payersArray addObject:[PayerCost payerWithDictionary:payer]];
    }
    
    installment.payersCost = [NSArray arrayWithArray:payersArray];
    
    return installment;
}

@end
