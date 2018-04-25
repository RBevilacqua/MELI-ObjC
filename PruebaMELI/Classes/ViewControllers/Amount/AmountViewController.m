//
//  AmountViewController.m
//  PruebaMELI
//
//  Created by Robert Bevilacqua on 17/4/18.
//  Copyright © 2018 Robert Bevilacqua. All rights reserved.
//

#import "AmountViewController.h"


@interface AmountViewController ()

@end

@implementation AmountViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configureScreen];
    self.amountTextField.delegate = self;
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)payAction:(UIButton *)sender {
    [self.amountTextField resignFirstResponder];
    if (self.amountTextField.text && self.amountTextField.text.length > 0) {
        self.amount = [self.amountTextField.text floatValue];
        PaymentMethodsViewController * vc = [[PaymentMethodsViewController alloc] init];
        vc.amount = [self.amountTextField.text floatValue];
        vc.delegate = self;
        [self.navigationController pushViewController:vc animated:YES];
        
    } else {
        [self.amountTextField shake];
    }
    
}

- (void)configureScreen{
    
    [Appearance underlined:[UIColor lightGrayColor] withTextField:self.amountTextField];
}

- (BOOL)validate:(NSString *)value {
    NSCharacterSet * aSet = [[NSCharacterSet characterSetWithCharactersInString:@"0123456789"] invertedSet];
    NSArray * compSepByCharInSet = [value componentsSeparatedByCharactersInSet:aSet];
    NSString * numberFiltered = [compSepByCharInSet componentsJoinedByString:@""];
    return ([value isEqualToString:numberFiltered]);
}


#pragma mark - UITextFieldDelegate methods

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    
    return [self validate:string];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [self.amountTextField resignFirstResponder];
    return YES;
}

#pragma mark - PaymentDelegate methods

- (void)retrievePayment:(IssuerCard *)issuer withPayer:(PayerCost *)payer withPayment:(PaymentMethods *)payment {
    
    UIViewController * amountViewController = [[self.navigationController viewControllers] firstObject];
    if([amountViewController isEqual:AmountViewController.class]) {
        [self.navigationController popToViewController:amountViewController animated:YES];
    
    } else {
        [self.navigationController popToRootViewControllerAnimated:YES];
    }
    
    dispatch_queue_t concurrentQueue =  dispatch_get_main_queue();
    dispatch_async(concurrentQueue, ^{
        
        MLViewAlert * alert = [[MLViewAlert alloc] init];
        [alert setDataWithPayment:payment issuer:issuer payer:payer amount:self.amount];
        [alert show:0.8];
        self.amount = 0;
        [self.amountTextField setText:@""];

    });
}

@end
