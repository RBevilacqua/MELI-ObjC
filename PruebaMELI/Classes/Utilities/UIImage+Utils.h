//
//  UIImage+Utils.h
//  PruebaMELI
//
//  Created by Robert Bevilacqua on 24/4/18.
//  Copyright © 2018 Robert Bevilacqua. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIView+Animation.h"

@interface UIImage (Utils)

+ (UIImage *)imageFromColor:(UIColor *)color;
+ (UIImage *)imageFromColor:(UIColor *)color size:(CGSize)size;
+ (UIImage *)imageWithColor:(UIColor *)color andBounds:(CGRect)imgBounds;

@end
