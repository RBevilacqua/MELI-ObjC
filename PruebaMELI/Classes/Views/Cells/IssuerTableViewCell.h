//
//  IssuerTableViewCell.h
//  PruebaMELI
//
//  Created by Robert Bevilacqua on 20/4/18.
//  Copyright © 2018 Robert Bevilacqua. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface IssuerTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *issuerImage;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

-(void)configureCell:(NSString *)title withImage:(NSString * _Nullable)imageString;

@end
