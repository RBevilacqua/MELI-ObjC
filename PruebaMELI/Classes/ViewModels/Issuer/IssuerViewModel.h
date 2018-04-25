//
//  IssuerViewModel.h
//  PruebaMELI
//
//  Created by Robert Bevilacqua on 23/4/18.
//  Copyright © 2018 Robert Bevilacqua. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ServicesManager.h"
#import "IssuerCard.h"

@interface IssuerViewModel : NSObject

@property (nonatomic, nullable) NSMutableArray<IssuerCard *> * issuer;

- (void)getIssuerWithPayment:(NSString *)paymentId callback:(void(^)(NSArray<IssuerCard *> * _Nullable, NSURLSessionDataTask * _Nullable, NSError * _Nullable error))callback;

@end
