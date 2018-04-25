//
//  InstallmentViewController.m
//  PruebaMELI
//
//  Created by Robert Bevilacqua on 19/4/18.
//  Copyright © 2018 Robert Bevilacqua. All rights reserved.
//

#import "InstallmentViewController.h"

@interface InstallmentViewController ()

@end

@implementation InstallmentViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.viewModel = [[InstallmentViewModel alloc] init];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerCells:@"InstallmentTableViewCell" withString:@"InstallmentTableViewCell"];
    [self configureView];
    
    [self.viewModel getInstallmentsWithPayment:self.payment.identifier issuer:self.issuerCard.identifier amount:self.amount callback:^(NSArray<Installments *> * _Nullable data, NSURLSessionDataTask * _Nullable task, NSError * _Nullable error) {
        
        if (error != nil) {
            dispatch_queue_t concurrentQueue =  dispatch_get_main_queue();
            dispatch_async(concurrentQueue, ^{
                [Message showWithText:@"Ha ocurrido un error. Intentalo más tarde" type:warning completion:nil];
                
            });
            
            
        } else {
            dispatch_queue_t concurrentQueue =  dispatch_get_main_queue();
            dispatch_async(concurrentQueue, ^{
                [self.tableView reloadData];
                
            });
            
        }
        
    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)configureView {
    
    [self configureTitleWithName:@"Seleccione Cuotas"];
    
    if (self.payment.name != nil) {
        [self.titleLabel setText:self.payment.name];
        
        if (self.payment.secureThumbnail != nil) {
            
            UIActivityIndicatorView *activityIndicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
            [activityIndicator setCenter: self.imageView.center];
            [activityIndicator startAnimating];
            [self.contentHeaderView addSubview:activityIndicator];
            
            dispatch_queue_t concurrentQueue =  dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
            dispatch_async(concurrentQueue, ^{
                
                NSError *error = nil;
                NSURL * url = [[NSURL alloc] initWithString:self.payment.secureThumbnail];
                
                NSData *image = [[NSData alloc] initWithContentsOfURL:url options:NSDataReadingUncached error:&error];
                
                if (error != nil) {
                    dispatch_async(dispatch_get_main_queue(), ^{
                        [activityIndicator stopAnimating];
                        [activityIndicator removeFromSuperview];
                        self.imageView.image = [UIImage imageNamed:@""];
                    });
                } else {
                    dispatch_async(dispatch_get_main_queue(), ^{
                        [activityIndicator stopAnimating];
                        [activityIndicator removeFromSuperview];
                        self.imageView.image = [UIImage imageWithData:image];
                    });
                }
                
                
            });
        }
        
    }
    
}

#pragma mark - UICollectionViewDelegate and UICollectionViewDataSource methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.viewModel.installments.firstObject.payersCost count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 70;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    InstallmentTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"InstallmentTableViewCell" forIndexPath:indexPath];
    
    Installments * install;
    NSArray<PayerCost *> * quotas;
    
    if ((install = self.viewModel.installments.firstObject)) {
        if ((quotas = install.payersCost)) {
            [cell configureCell:[quotas objectAtIndex:indexPath.row]];
        }
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    PayerCost * payer = [self.viewModel.installments.firstObject.payersCost objectAtIndex:indexPath.row];
    [self.delegate retrievePayCost:payer];
    
}

@end
