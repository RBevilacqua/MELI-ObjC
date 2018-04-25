//
//  PaymentDelegate.h
//  PruebaMELI
//
//  Created by Robert Bevilacqua on 18/4/18.
//  Copyright © 2018 Robert Bevilacqua. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PayerCost.h"
#import "IssuerCard.h"
#import "PaymentMethods.h"

@protocol PaymentDelegate <NSObject>

-(void)retrievePayment:(IssuerCard *)issuer withPayer:(PayerCost *)payer withPayment:(PaymentMethods *)payment;

@end
