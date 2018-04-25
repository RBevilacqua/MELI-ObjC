//
//  AmountViewController.h
//  PruebaMELI
//
//  Created by Robert Bevilacqua on 17/4/18.
//  Copyright © 2018 Robert Bevilacqua. All rights reserved.
//

#import "ViewController.h"
#import "Appearance.h"
#import "UIView+Animation.h"
#import "PaymentMethodsViewController.h"

@interface AmountViewController : ViewController <UITextFieldDelegate, PaymentDelegate>

@property (nonatomic) float amount;
@property (weak, nonatomic) IBOutlet UITextField *amountTextField;
@property (weak, nonatomic) IBOutlet UIButton *payButton;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *constraintPayButton;

- (BOOL)validate:(NSString *)value;

@end
