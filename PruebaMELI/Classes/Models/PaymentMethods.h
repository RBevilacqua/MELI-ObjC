//
//  PaymentMethods.h
//  PruebaMELI
//
//  Created by Robert Bevilacqua on 19/4/18.
//  Copyright © 2018 Robert Bevilacqua. All rights reserved.
//

#import <Foundation/Foundation.h>


typedef NS_ENUM(NSUInteger, MLStatus) {
    active,
    inactive
};

@interface PaymentMethods : NSObject

@property (nonatomic, nullable) NSString * identifier;
@property (nonatomic, nullable) NSString * name;
@property (nonatomic, nullable) NSString * paymentTypeId;
@property (nonatomic, nullable) NSString * thumbnail;
@property (nonatomic, nullable) NSString * secureThumbnail;
@property (nonatomic) MLStatus statusCode;
@property (nonatomic, nullable) NSArray * progresingModes;
@property (nonatomic) float minAllowedAmount;
@property (nonatomic) float maxAllowedAmount;
@property (nonatomic) int accreditationTime;


- (instancetype)initWithIdentifier:(NSString *)identifier
                              name:(NSString *)name
                       typePayment:(NSString *)paymentTypeId
                             image:(NSString *)thumbnail
                       secureImage:(NSString *)secureThumbnail
                       status:(MLStatus)statusCode
                         minAmount:(float)minAllowedAmount
                         maxAmount:(float)maxAllowedAmount
                 accreditationTime:(int)accreditationTime;

+ (instancetype)paymentMethodsWithDictionary:(NSDictionary *)objc;



@end
