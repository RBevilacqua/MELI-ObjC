//
//  MLViewAlert.h
//  PruebaMELI
//
//  Created by Robert Bevilacqua on 20/4/18.
//  Copyright © 2018 Robert Bevilacqua. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PaymentMethods.h"
#import "IssuerCard.h"
#import "PayerCost.h"
#import "Installments.h"

@interface MLViewAlert : UIView

@property (weak, nonatomic) IBOutlet UIView *contentView;
@property (weak, nonatomic) IBOutlet UIView *contentViewPayment;
@property (weak, nonatomic) IBOutlet UIView *contentViewIssuer;
@property (weak, nonatomic) IBOutlet UIView *contentViewInstallment;

@property (weak, nonatomic) IBOutlet UIImageView *paymentImage;
@property (weak, nonatomic) IBOutlet UILabel *paymentLabel;

@property (weak, nonatomic) IBOutlet UIImageView *issuerImage;
@property (weak, nonatomic) IBOutlet UILabel *issuerLabel;

@property (weak, nonatomic) IBOutlet UILabel *installmentLabel;

@property (weak, nonatomic) IBOutlet UILabel *totalLabel;
@property (weak, nonatomic) IBOutlet UIButton *acceptButton;

- (instancetype)initWithName:(NSString *)loadString frame:(CGRect)frame;
- (void)setDataWithPayment:(PaymentMethods *)payment issuer:(IssuerCard *)issuer payer:(PayerCost *)payer amount:(float)amount;
- (void)setImage:(NSString *)image over:(UIImageView *)imageView;
- (void)configureScreen;
- (IBAction)acceptAction:(UIButton *)sender;
- (void)loadViewFromNib:(NSString *)nibName;
- (void)show:(NSTimeInterval)timer;
- (void)dismiss;

@end
