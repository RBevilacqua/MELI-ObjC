//
//  UITableView+Register.m
//  PruebaMELI
//
//  Created by Robert Bevilacqua on 20/4/18.
//  Copyright © 2018 Robert Bevilacqua. All rights reserved.
//

#import "UITableView+Register.h"

@implementation UITableView (Register)

-(void)registerCells:(NSString *)nibName withString:(NSString *)cellIdentifier {
    UINib * listNib = [UINib nibWithNibName:nibName bundle:nil];
    [self registerNib:listNib forCellReuseIdentifier:cellIdentifier];
}

@end
