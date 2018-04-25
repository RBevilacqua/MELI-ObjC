//
//  ServicesManager.h
//  PruebaMELI
//
//  Created by Robert Bevilacqua on 19/4/18.
//  Copyright © 2018 Robert Bevilacqua. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking.h>

@interface ServicesManager : NSObject

@property (nonatomic, nonnull) NSString * baseURL;
@property (nonatomic, nonnull) NSDictionary * params;

+ (NSDictionary *)getParams;
+ (NSString *)getBaseURLWithPath:(NSString * _Nullable)path;

+ (void)requestJSONWithPath:(NSString * _Nullable)path method:(NSString *)method params:(NSDictionary *)params headers:(NSDictionary *)headers callback:(void (^)(NSURLSessionDataTask * _Nonnull task, id _Nullable, NSError * _Nullable error))callback;

@end
