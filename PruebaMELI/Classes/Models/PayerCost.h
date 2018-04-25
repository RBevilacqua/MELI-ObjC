//
//  PayerCost.h
//  PruebaMELI
//
//  Created by Robert Bevilacqua on 19/4/18.
//  Copyright © 2018 Robert Bevilacqua. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PayerCost : NSObject

@property (nonatomic) float installments;
@property (nonatomic) float installmentRate;
@property (nonatomic) float discountRate;
@property (nonatomic) float minAllowedAmount;
@property (nonatomic) float maxAllowedAmount;
@property (nonatomic) float installmentAmount;
@property (nonatomic) float totalAmount;

@property (nonatomic, nullable) NSString * recommendedMessage;
@property (nonatomic, nullable) NSArray * installmentRateCollector;
@property (nonatomic, nullable) NSArray * labels;

+ (instancetype)payerWithDictionary:(NSDictionary *)objc;

@end
