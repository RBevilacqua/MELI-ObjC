//
//  Appearance.m
//  PruebaMELI
//
//  Created by Robert Bevilacqua on 17/4/18.
//  Copyright © 2018 Robert Bevilacqua. All rights reserved.
//

#import "Appearance.h"

@implementation Appearance

+ (void)underlined:(UIColor *)color withTextField:(UITextField *)textField {
    CALayer *border = [CALayer layer];
    CGFloat width = 1.0;
    border.borderColor = color.CGColor;
    border.frame = CGRectMake(0, textField.frame.size.height - width, textField.frame.size.width, textField.frame.size.height);
    border.borderWidth = width;
    [textField.layer addSublayer:border];
    textField.layer.masksToBounds = YES;
}

+ (void)setNavigationBarWithColor:(UIColor *)color navigationBar:(UINavigationBar *)navigationBar {
    
    [navigationBar setBackgroundImage:[[UIImage imageFromColor:color] resizableImageWithCapInsets:UIEdgeInsetsMake(1, 1, 1, 1) resizingMode:UIImageResizingModeStretch] forBarMetrics:UIBarMetricsDefault];
    [navigationBar setBarTintColor:[UIColor whiteColor]];
    [navigationBar setShadowImage:[[UIImage alloc] init]];
}


@end
