//
//  Installments.h
//  PruebaMELI
//
//  Created by Robert Bevilacqua on 19/4/18.
//  Copyright © 2018 Robert Bevilacqua. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IssuerCard.h"
#import "PayerCost.h"

@interface Installments : NSObject

@property (nonatomic, nullable) NSString * paymentMethodId;
@property (nonatomic, nullable) NSString * paymentTypeId;
@property (nonatomic, nullable) NSString * processingMode;
@property (nonatomic, nullable) NSString * merchantAccountId;

@property (nonatomic, nullable) IssuerCard * issuer;
@property (nonatomic, nullable) NSArray<PayerCost *> * payersCost;

+ (instancetype)installmentWithDictionary:(NSDictionary *)objc;

@end
