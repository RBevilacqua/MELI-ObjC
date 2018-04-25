//
//  UIView+Animation.m
//  PruebaMELI
//
//  Created by Robert Bevilacqua on 18/4/18.
//  Copyright © 2018 Robert Bevilacqua. All rights reserved.
//

#import "UIView+Animation.h"

@implementation UIView (Animations)

- (void)shake {
    CAKeyframeAnimation * animation = [[CAKeyframeAnimation alloc] init];
    [animation setKeyPath:@"transform.translation.x"];
    [animation setValues:@[ @(-20), @(20), @(-20), @(20), @(-10), @(10), @(-5), @(5), @(0) ]];
    animation.duration = 0.6;
    [self.layer addAnimation:animation forKey:@"shake"];

}

- (UIImage *)convertToImage {
    UIGraphicsBeginImageContext([self bounds].size);
    [self.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage * viewImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return viewImage;
    
//    CGRect rect = CGRectMake(0, 0, 10, 10);
//    UIGraphicsBeginImageContext(rect.size);
//    CGContextRef context = UIGraphicsGetCurrentContext();
//    CGContextSetFillColorWithColor(context, [color CGColor]);
//    CGContextFillRect(context, rect);
//    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
//    UIGraphicsEndImageContext();
//    return image;
}

@end
