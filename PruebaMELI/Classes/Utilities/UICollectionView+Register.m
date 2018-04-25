//
//  UICollectionView+Register.m
//  PruebaMELI
//
//  Created by Robert Bevilacqua on 20/4/18.
//  Copyright © 2018 Robert Bevilacqua. All rights reserved.
//

#import "UICollectionView+Register.h"

@implementation UICollectionView (Register)

-(void)registerCells:(NSString *)nibName withString:(NSString *)cellIdentifier {
    UINib * listNib = [UINib nibWithNibName:nibName bundle:nil];
    [self registerNib:listNib forCellWithReuseIdentifier:cellIdentifier];
}

@end
