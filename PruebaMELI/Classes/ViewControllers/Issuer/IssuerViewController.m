//
//  IssuerViewController.m
//  PruebaMELI
//
//  Created by Robert Bevilacqua on 19/4/18.
//  Copyright © 2018 Robert Bevilacqua. All rights reserved.
//

#import "IssuerViewController.h"

@interface IssuerViewController ()

@end

@implementation IssuerViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.viewModel = [[IssuerViewModel alloc] init];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView setTableFooterView:[[UIView alloc] init]];
    
    [self configureTitleWithName:@"Selecciona el Banco"];
    
    [self.tableView registerCells:@"IssuerTableViewCell" withString:@"IssuerTableViewCell"];
    [self.viewModel getIssuerWithPayment:self.payment.identifier callback:^(NSArray<IssuerCard *> * _Nullable data, NSURLSessionDataTask * _Nullable task, NSError * _Nullable error) {
        
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

#pragma mark - UICollectionViewDelegate and UICollectionViewDataSource methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.viewModel.issuer count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 70;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    IssuerTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"IssuerTableViewCell" forIndexPath:indexPath];
    
//    NSString * title = [NSString stringWithFormat:@"Prueba Payment %ld", indexPath.row];
    [cell configureCell:[self.viewModel.issuer objectAtIndex:indexPath.row].name withImage:[self.viewModel.issuer objectAtIndex:indexPath.row].secureThumbnail];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    self.issuerSelected = [self.viewModel.issuer objectAtIndex:indexPath.row];
    
    InstallmentViewController * vc = [[InstallmentViewController alloc] init];
    vc.amount = self.amount;
    vc.payment = self.payment;
    vc.issuerCard = self.issuerSelected;
    vc.delegate = self;
    [self.navigationController pushViewController:vc animated:YES];
    
}


#pragma mark - InstallmentDelegate methods

- (void)retrievePayCost:(PayerCost *)payer {    
    [self.delegate retrieveIssuer:self.issuerSelected withPayer:payer];
}

@end
