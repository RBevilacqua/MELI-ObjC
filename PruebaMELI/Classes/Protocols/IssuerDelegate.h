//
//  IssuerDelegate.h
//  PruebaMELI
//
//  Created by Robert Bevilacqua on 20/4/18.
//  Copyright © 2018 Robert Bevilacqua. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PayerCost.h"
#import "IssuerCard.h"

@protocol IssuerDelegate <NSObject>

-(void)retrieveIssuer:(IssuerCard *)issuer withPayer:(PayerCost *)payer;

@end
