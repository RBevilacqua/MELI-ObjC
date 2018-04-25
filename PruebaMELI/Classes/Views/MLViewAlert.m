//
//  MLViewAlert.m
//  PruebaMELI
//
//  Created by Robert Bevilacqua on 20/4/18.
//  Copyright © 2018 Robert Bevilacqua. All rights reserved.
//

#import "MLViewAlert.h"

@implementation MLViewAlert

- (instancetype)initWithFrame:(CGRect)frame {
    return [super initWithFrame:frame];
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    return [super initWithCoder:aDecoder];
}

- (instancetype)init {
    CGRect frame = CGRectMake(0, [[UIScreen mainScreen] bounds].size.height, [[UIScreen mainScreen] bounds].size.width, [[UIScreen mainScreen] bounds].size.height);
    self = [super initWithFrame:frame];
    if (self) {
        [self loadViewFromNib:@"MLViewAlert"];
        [self configureScreen];
    }
    return self;
}

- (instancetype)initWithName:(NSString *)loadString frame:(CGRect)frame {
    self = [super initWithFrame:frame];
    [self loadViewFromNib:loadString];
    return self;
}

- (void)setDataWithPayment:(PaymentMethods *)payment issuer:(IssuerCard *)issuer payer:(PayerCost *)payer amount:(float)amount {
    
    [self.paymentLabel setText:payment.name];
    [self.issuerLabel setText:issuer.name];
    [self.installmentLabel setText:payer.recommendedMessage];
    
    if (payment.secureThumbnail != nil) {
        [self setImage:payment.secureThumbnail over:self.paymentImage];
    }
    
    if (issuer.secureThumbnail != nil) {
        [self setImage:issuer.secureThumbnail over:self.issuerImage];
    }
    
    [self.totalLabel setText:[NSString stringWithFormat:@"Total $ %.2f", amount]];
    
}

- (void)setImage:(NSString *)image over:(UIImageView *)imageView {
    UIActivityIndicatorView *activityIndicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    [activityIndicator setCenter: imageView.center];
    [activityIndicator startAnimating];
    [self.contentView addSubview:activityIndicator];
    
    dispatch_queue_t concurrentQueue =  dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_async(concurrentQueue, ^{
        
        NSError *error = nil;
        NSURL * url = [[NSURL alloc] initWithString:image];
        
        NSData *image = [[NSData alloc] initWithContentsOfURL:url options:NSDataReadingUncached error:&error];
        
        if (error != nil) {
            dispatch_async(dispatch_get_main_queue(), ^{
                [activityIndicator stopAnimating];
                [activityIndicator removeFromSuperview];
                imageView.image = [UIImage imageNamed:@""];
            });
        } else {
            dispatch_async(dispatch_get_main_queue(), ^{
                [activityIndicator stopAnimating];
                [activityIndicator removeFromSuperview];
                imageView.image = [UIImage imageWithData:image];
            });
        }
        
        
    });
}

- (void)configureScreen {
    self.contentView.alpha = 0;
    self.contentView.layer.cornerRadius = 4.0;
    self.contentViewPayment.layer.cornerRadius = 4.0;
    self.contentViewIssuer.layer.cornerRadius = 4.0;
    self.contentViewInstallment.layer.cornerRadius = 4.0;
}

- (void)show:(NSTimeInterval)timer {
    [UIApplication.sharedApplication.keyWindow addSubview:self];
    
    [UIView animateWithDuration:timer animations:^{
        CGRect frame = self.frame;
        frame.origin.y = 0;
        self.frame = frame;
        
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:timer animations:^{
            self.contentView.alpha = 1;
            self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.6];
        }];
    }];
    
}

- (IBAction)acceptAction:(UIButton *)sender {
    [self dismiss];
}

- (void)loadViewFromNib:(NSString *)nibName {
    NSBundle *bundle = [NSBundle bundleForClass:self.class];
    MLViewAlert * view = (MLViewAlert *)[[bundle loadNibNamed:nibName owner:self options:nil] firstObject];
    view.frame = [self bounds];
    view.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [self addSubview:view];
}

- (void)dismiss {
    
    [UIView animateWithDuration:0.5 animations:^{
        self.contentView.alpha = 0;
        self.backgroundColor = UIColor.clearColor;
        
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.8 animations:^{
            CGRect frame = self.frame;
            frame.origin.y = [[UIScreen mainScreen] bounds].size.height;
            self.frame = frame;
            
        } completion:^(BOOL finished) {
            [self removeFromSuperview];
            
        }];
        
    }];
    
}

@end
