//
//  IssuerCard.h
//  PruebaMELI
//
//  Created by Robert Bevilacqua on 19/4/18.
//  Copyright © 2018 Robert Bevilacqua. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface IssuerCard : NSObject

@property (nonatomic, nullable) NSString * identifier;
@property (nonatomic, nullable) NSString * name;
@property (nonatomic, nullable) NSString * processingMode;
@property (nonatomic, nullable) NSString * thumbnail;
@property (nonatomic, nullable) NSString * secureThumbnail;
@property (nonatomic, nullable) NSString * merchantAccountId;

+ (instancetype)issuerWithDictionary:(NSDictionary *)objc;

@end
