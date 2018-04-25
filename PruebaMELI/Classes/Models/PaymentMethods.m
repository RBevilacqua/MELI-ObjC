//
//  PaymentMethods.m
//  PruebaMELI
//
//  Created by Robert Bevilacqua on 19/4/18.
//  Copyright © 2018 Robert Bevilacqua. All rights reserved.
//

#import "PaymentMethods.h"

@implementation PaymentMethods

- (instancetype)initWithIdentifier:(NSString *)identifier
                              name:(NSString *)name
                       typePayment:(NSString *)paymentTypeId
                             image:(NSString *)thumbnail
                       secureImage:(NSString *)secureThumbnail
                            status:(MLStatus)statusCode
                         minAmount:(float)minAllowedAmount
                         maxAmount:(float)maxAllowedAmount
                 accreditationTime:(int)accreditationTime {
    
    self = [super init];
    if (!self) return nil;
    
    _identifier = [identifier copy];
    _name = [name copy];
    _paymentTypeId = [paymentTypeId copy];
    _thumbnail = [thumbnail copy];
    _secureThumbnail = [secureThumbnail copy];
    
    _minAllowedAmount = minAllowedAmount;
    _maxAllowedAmount = maxAllowedAmount;
    _accreditationTime = accreditationTime;
    
    return self;
    
}


+ (instancetype)paymentMethodsWithDictionary:(NSDictionary *)objc {
    
    PaymentMethods * payment = [[PaymentMethods alloc] init];
    
    NSString *status = [[objc valueForKey:@"status"]
                        lowercaseString];
    
    MLStatus value = ([status isEqualToString:@"active"]) ? active : inactive;
    
    payment.identifier = [objc valueForKey:@"id"];
    payment.name = [objc valueForKey:@"name"];
    payment.paymentTypeId = [objc valueForKey:@"payment_type_id"];
    payment.thumbnail = [objc valueForKey:@"thumbnail"];
    payment.statusCode = value;
    payment.secureThumbnail = [objc valueForKey:@"secure_thumbnail"];
    payment.minAllowedAmount = [[objc valueForKey:@"min_allowed_amount"] floatValue];
    payment.maxAllowedAmount = [[objc valueForKey:@"max_allowed_amount"] floatValue];
    payment.accreditationTime = ([[objc valueForKey:@"accreditation_time"] floatValue]);
    
    return payment;
}

@end
