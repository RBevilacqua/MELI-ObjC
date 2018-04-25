//
//  PaymentMethodsViewController.m
//  PruebaMELI
//
//  Created by Robert Bevilacqua on 18/4/18.
//  Copyright © 2018 Robert Bevilacqua. All rights reserved.
//

#import "PaymentMethodsViewController.h"

@interface PaymentMethodsViewController ()

@end

@implementation PaymentMethodsViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.isGrid = YES;
        self.viewModel = [[PaymentMethodsViewModel alloc] init];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.collectionView registerCells:@"PaymentCollectionViewCell" withString:@"PaymentCollectionViewCell"];
    
    [self configureTitleWithName:@"Seleccione Método de Pago"];
    
//    [Message showWithText:@"Ha ocurrido un error. Intentalo más tarde" type:success completion:nil];
    
    [self.viewModel getPaymentMethods:^(NSArray<PaymentMethods *> * _Nullable data, NSURLSessionDataTask * _Nullable task, NSError * _Nullable error) {
        if (error != nil) {
            dispatch_queue_t concurrentQueue =  dispatch_get_main_queue();
            dispatch_async(concurrentQueue, ^{
                [Message showWithText:@"Ha ocurrido un error. Intentalo más tarde" type:warning completion:nil];
                
            });
            
            
        } else {
            dispatch_queue_t concurrentQueue =  dispatch_get_main_queue();
            dispatch_async(concurrentQueue, ^{
                [self.collectionView reloadData];
                
            });
            
        }
    }];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - UICollectionViewDelegate and UICollectionViewDataSource methods

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [self.viewModel.paymentMethods count];
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:   (UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake([[UIScreen mainScreen] bounds].size.width, 90);
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    PaymentCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"PaymentCollectionViewCell" forIndexPath:indexPath];
    
//    NSString * title = [NSString stringWithFormat:@"Prueba Payment %ld", indexPath.row];
    [cell configureCell:[self.viewModel.paymentMethods objectAtIndex:indexPath.row].name withImage:[self.viewModel.paymentMethods objectAtIndex:indexPath.row].secureThumbnail];
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    [self.collectionView deselectItemAtIndexPath:indexPath animated:YES];
    
    IssuerViewController * vc = [[IssuerViewController alloc] init];
    self.paymentSelected = self.viewModel.paymentMethods[indexPath.row];
    vc.amount = self.amount;
    vc.payment = self.paymentSelected;
    vc.delegate = self;
    [self.navigationController pushViewController:vc animated:YES];
    
}


#pragma mark - IssuerDelegate methods

- (void)retrieveIssuer:(IssuerCard *)issuer withPayer:(PayerCost *)payer {
    [self.delegate retrievePayment:issuer withPayer:payer withPayment:self.paymentSelected];
}

@end
