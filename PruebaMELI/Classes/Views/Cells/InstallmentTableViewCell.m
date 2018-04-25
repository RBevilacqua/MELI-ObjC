//
//  InstallmentTableViewCell.m
//  PruebaMELI
//
//  Created by Robert Bevilacqua on 20/4/18.
//  Copyright © 2018 Robert Bevilacqua. All rights reserved.
//

#import "InstallmentTableViewCell.h"

@implementation InstallmentTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)configureCell:(PayerCost *)payer {
    [self.titleLabel setText:payer.recommendedMessage];
    NSMutableString * quota = [[NSMutableString alloc] initWithString:@""];
    
    if (payer.installmentAmount > 0) {
        [quota appendFormat:@"$ %.2f", payer.installmentAmount];
    }
    
    [self.amountLabel setText:quota];
    
    
    
//    if let installAmount = data.installment_amount {
//        self.quotaLabel.text = "$ \(installAmount)"
//    } else {
//        self.quotaLabel.text = ""
//    }
}

@end
