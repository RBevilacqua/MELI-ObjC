//
//  IssuerViewController.h
//  PruebaMELI
//
//  Created by Robert Bevilacqua on 19/4/18.
//  Copyright © 2018 Robert Bevilacqua. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
#import "UITableView+Register.h"
#import "IssuerTableViewCell.h"
#import "InstallmentViewController.h"
#import "IssuerDelegate.h"
#import "MLViewAlert.h"
#import "IssuerViewModel.h"
#import "Message.h"

@interface IssuerViewController : BaseViewController <UITableViewDelegate, UITableViewDataSource, InstallmentDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic) float amount;
@property (nonatomic) IssuerCard * issuerSelected;
@property (nonatomic) PaymentMethods * payment;
@property(nonatomic, weak) id<IssuerDelegate> delegate;
@property(nonatomic) IssuerViewModel * viewModel;

@end
