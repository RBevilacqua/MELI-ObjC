//
//  UINavigationController+Appearance.m
//  PruebaMELI
//
//  Created by Robert Bevilacqua on 24/4/18.
//  Copyright © 2018 Robert Bevilacqua. All rights reserved.
//

#import "UINavigationController+Appearance.h"

@implementation UINavigationController (Appearance)

- (void)setNavigationBarWithColor:(UIColor *)color {
    [self.navigationBar setBackgroundImage:[UIImage imageFromColor:color] forBarMetrics:UIBarMetricsDefault];
    [self.navigationBar setBarTintColor:[UIColor whiteColor]];
    [self.navigationBar setShadowImage:[[UIImage alloc] init]];
}

@end
