//
//  InstallmentViewController.h
//  PruebaMELI
//
//  Created by Robert Bevilacqua on 19/4/18.
//  Copyright © 2018 Robert Bevilacqua. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
#import "PaymentMethods.h"
#import "InstallmentTableViewCell.h"
#import "UITableView+Register.h"
#import "InstallmentDelegate.h"
#import "IssuerCard.h"
#import "InstallmentViewModel.h"
#import "Message.h"

@interface InstallmentViewController : BaseViewController <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIView *contentHeaderView;

@property (nonatomic) float amount;
@property (nonatomic) IssuerCard *issuerCard;
@property (nonatomic) PaymentMethods *payment;
@property(nonatomic, weak) id<InstallmentDelegate> delegate;
@property(nonatomic) InstallmentViewModel * viewModel;

- (void)configureView;

@end
