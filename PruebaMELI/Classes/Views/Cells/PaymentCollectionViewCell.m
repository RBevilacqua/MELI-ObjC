//
//  PaymentCollectionViewCell.m
//  PruebaMELI
//
//  Created by Robert Bevilacqua on 19/4/18.
//  Copyright © 2018 Robert Bevilacqua. All rights reserved.
//

#import "PaymentCollectionViewCell.h"

@implementation PaymentCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)configureCell:(NSString *)title withImage:(NSString * _Nullable)imageString {
    [self.titleLabel setText:title];
    
    UIActivityIndicatorView *activityIndicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    [activityIndicator setCenter: self.paymentImage.center];
    [activityIndicator startAnimating];
    [self.contentView addSubview:activityIndicator];
    
    dispatch_queue_t concurrentQueue =  dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_async(concurrentQueue, ^{
        
        NSError *error = nil;
        NSURL * url = [[NSURL alloc] initWithString:imageString];
        
        NSData *image = [[NSData alloc] initWithContentsOfURL:url options:NSDataReadingUncached error:&error];
        
        if (error != nil) {
            dispatch_async(dispatch_get_main_queue(), ^{
                [activityIndicator stopAnimating];
                [activityIndicator removeFromSuperview];
                self.paymentImage.image = [UIImage imageNamed:@""];
            });
        } else {
            dispatch_async(dispatch_get_main_queue(), ^{
                [activityIndicator stopAnimating];
                [activityIndicator removeFromSuperview];
                self.paymentImage.image = [UIImage imageWithData:image];
            });
        }
        
        
    });
    
}

@end
