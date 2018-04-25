//
//  UIImage+Utils.m
//  PruebaMELI
//
//  Created by Robert Bevilacqua on 24/4/18.
//  Copyright © 2018 Robert Bevilacqua. All rights reserved.
//

#import "UIImage+Utils.h"

@implementation UIImage (Utils)

+ (UIImage *)imageFromColor:(UIColor *)color {
    return [UIImage imageFromColor:color size:CGSizeMake(10, 10)];
}

+ (UIImage *)imageFromColor:(UIColor *)color size:(CGSize)size {
    UIView * imageView = [[UIView alloc] initWithFrame: CGRectMake(0, 0, size.width, size.height)];
    [imageView setBackgroundColor:color];
    return [imageView convertToImage];
}

+ (UIImage *)imageWithColor:(UIColor *)color andBounds:(CGRect)imgBounds {
    UIGraphicsBeginImageContextWithOptions(imgBounds.size, NO, 0);
    [color setFill];
    UIRectFill(imgBounds);
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return img;
}

@end
