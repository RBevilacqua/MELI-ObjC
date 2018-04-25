//
//  Loading.h
//  PruebaMELI
//
//  Created by Robert Bevilacqua on 22/4/18.
//  Copyright © 2018 Robert Bevilacqua. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Loading : UIView
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
//@property (weak, nonatomic) IBOutlet SpinnerView *icon;
@property (weak, nonatomic) IBOutlet UIView *contentLoading;
@property (weak, nonatomic) IBOutlet UIView *contentView;

@end
