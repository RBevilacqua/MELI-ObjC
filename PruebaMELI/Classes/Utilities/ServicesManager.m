//
//  ServicesManager.m
//  PruebaMELI
//
//  Created by Robert Bevilacqua on 19/4/18.
//  Copyright © 2018 Robert Bevilacqua. All rights reserved.
//

#import "ServicesManager.h"

@implementation ServicesManager

+ (NSDictionary *)getParams {
    return @{@"public_key": @"444a9ef5‐8a6b‐429f‐abdf‐587639155d88"};
}

+ (NSString *)getBaseURLWithPath:(NSString *)path {
    NSMutableString *base = [[NSMutableString alloc] initWithString:@"https://api.mercadopago.com/v1/payment_methods"];
    
    if (path != nil) {
//        base = [[base stringByAppendingString:@"/"] stringByAppendingString:path];
        [base appendString:@"/"];
        [base appendString:path];
    }
    
    return (NSString *)base;
}


+ (void)requestJSONWithPath:(NSString * _Nullable)path method:(NSString *)method params:(NSDictionary *)params headers:(NSDictionary *)headers callback:(void (^)(NSURLSessionDataTask * _Nonnull task, id _Nullable, NSError * _Nullable error))callback {
   
    NSURL *URL = [NSURL URLWithString:[ServicesManager getBaseURLWithPath:path]];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    if ([method isEqualToString:@"POST"]) {
        [manager POST:URL.absoluteString parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            NSLog(@"JSON: %@", responseObject);
            callback(task, responseObject, nil);
            
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            NSLog(@"Error: %@", error);
            callback(task, nil, error);
            
        }];
        
        return;
    }
    
    if ([method isEqualToString:@"GET"]) {
        
        [manager GET:URL.absoluteString parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            NSLog(@"JSON: %@", responseObject);
            callback(task, responseObject, nil);
            
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            NSLog(@"Error: %@", error);
            callback(task, nil, error);
            
        }];
        
        return;
    }
    
    if ([method isEqualToString:@"PUT"]) {
        return;
    } if ([method isEqualToString:@"DELETE"]) {
        return;
    }
    
    
}

@end
