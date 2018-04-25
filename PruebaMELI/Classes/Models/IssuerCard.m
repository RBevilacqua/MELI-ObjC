//
//  IssuerCard.m
//  PruebaMELI
//
//  Created by Robert Bevilacqua on 19/4/18.
//  Copyright © 2018 Robert Bevilacqua. All rights reserved.
//

#import "IssuerCard.h"

@implementation IssuerCard

+ (instancetype)issuerWithDictionary:(NSDictionary *)objc {
    
    IssuerCard * issuer = [[IssuerCard alloc] init];
    
    issuer.identifier = [objc valueForKey:@"id"];
    issuer.name = [objc valueForKey:@"name"];
    issuer.thumbnail = [objc valueForKey:@"thumbnail"];
    issuer.secureThumbnail = [objc valueForKey:@"secure_thumbnail"];
    issuer.processingMode = [objc valueForKey:@"processing_mode"];
    issuer.merchantAccountId = [objc valueForKey:@"merchant_account_id"];
    
    return issuer;
}

@end
