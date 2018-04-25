//
//  Appearance.h
//  PruebaMELI
//
//  Created by Robert Bevilacqua on 17/4/18.
//  Copyright © 2018 Robert Bevilacqua. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "UIImage+Utils.h"

@interface Appearance : NSObject

+ (void)underlined:(UIColor *)color withTextField:(UITextField *)textField;
+ (void)setNavigationBarWithColor:(UIColor *)color navigationBar:(UINavigationBar *)navigationBar;

@end
