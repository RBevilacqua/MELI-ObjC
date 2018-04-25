//
//  InstallmentViewModel.h
//  PruebaMELI
//
//  Created by Robert Bevilacqua on 23/4/18.
//  Copyright © 2018 Robert Bevilacqua. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Installments.h"
#import "ServicesManager.h"

@interface InstallmentViewModel : NSObject

@property (nonatomic, nullable) NSMutableArray<Installments *> * installments;

- (void)getInstallmentsWithPayment:(NSString *)paymentId issuer:(NSString *)issuerId amount:(float)amount callback:(void(^)(NSArray<Installments *> * _Nullable, NSURLSessionDataTask * _Nullable, NSError * _Nullable error))callback;

@end
