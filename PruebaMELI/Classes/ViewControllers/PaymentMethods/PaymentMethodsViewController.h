//
//  PaymentMethodsViewController.h
//  PruebaMELI
//
//  Created by Robert Bevilacqua on 18/4/18.
//  Copyright © 2018 Robert Bevilacqua. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PaymentCollectionViewCell.h"
#import "BaseViewController.h"
#import "UICollectionView+Register.h"
#import "IssuerViewController.h"
#import "PaymentDelegate.h"
#import "Message.h"
#import "PaymentMethodsViewModel.h"

@interface PaymentMethodsViewController : BaseViewController <UICollectionViewDelegate, UICollectionViewDataSource, IssuerDelegate>

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@property(nonatomic) float amount;
@property(nonatomic) Boolean isGrid;
@property(nonatomic, weak) id<PaymentDelegate> delegate;
@property(nonatomic) PaymentMethodsViewModel * viewModel;
@property(nonatomic) PaymentMethods * paymentSelected;

@end

