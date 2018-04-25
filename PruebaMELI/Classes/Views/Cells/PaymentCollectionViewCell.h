//
//  PaymentCollectionViewCell.h
//  PruebaMELI
//
//  Created by Robert Bevilacqua on 19/4/18.
//  Copyright © 2018 Robert Bevilacqua. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PaymentCollectionViewCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UIImageView *paymentImage;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

-(void)configureCell:(NSString *)title withImage:(NSString * _Nullable)imageString;

@end
