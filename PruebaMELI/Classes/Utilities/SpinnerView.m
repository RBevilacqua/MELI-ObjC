//
//  SpinnerView.m
//  PruebaMELI
//
//  Created by Robert Bevilacqua on 22/4/18.
//  Copyright © 2018 Robert Bevilacqua. All rights reserved.
//

#import "SpinnerView.h"

@implementation SpinnerView

+ (Class)layerClass {
    return CAShapeLayer.superclass;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    ((CAShapeLayer *)[self layer]).fillColor = nil;
    ((CAShapeLayer *)[self layer]).strokeColor = UIColor.blackColor.CGColor;
    ((CAShapeLayer *)[self layer]).lineWidth = 5;
    [self setPath];
    
}

- (void)didMoveToWindow {
    [self animate];
}

- (void)setPath {
    ((CAShapeLayer *)[self layer]).path = [UIBezierPath bezierPathWithOvalInRect: CGRectOffset(self.bounds, ((CAShapeLayer *)[self layer]).lineWidth / 2, ((CAShapeLayer *)[self layer]).lineWidth / 2)].CGPath;
}

+ (NSArray *)getPoses {
    
    NSMutableArray * poses = [[NSMutableArray alloc] init];
    
    Pose * aux1;
    aux1.secondsSincePriorPose = 0.0;
    aux1.start = 0.000;
    aux1.lenght = 0.7;
    
    Pose * aux2;
    aux2.secondsSincePriorPose = 0.6;
    aux2.start = 0.500;
    aux2.lenght = 0.5;
    
    Pose * aux3;
    aux3.secondsSincePriorPose = 0.6;
    aux3.start = 1.000;
    aux3.lenght = 0.3;
    
    Pose * aux4;
    aux4.secondsSincePriorPose = 0.6;
    aux4.start = 1.500;
    aux4.lenght = 0.1;
    
    Pose * aux5;
    aux5.secondsSincePriorPose = 0.2;
    aux5.start = 1.875;
    aux5.lenght = 0.1;
    
    Pose * aux6;
    aux6.secondsSincePriorPose = 0.2;
    aux6.start = 2.250;
    aux6.lenght = 0.3;
    
    Pose * aux7;
    aux7.secondsSincePriorPose = 0.2;
    aux7.start = 2.625;
    aux7.lenght = 0.4;
    
    Pose * aux8;
    aux8.secondsSincePriorPose = 0.2;
    aux8.start = 3.000;
    aux8.lenght = 0.7;
    
    
    [poses arrayByAddingObject:@[(aux1), (aux2), (aux3), (aux4), (aux5), (aux6), (aux7), (aux8)]];
    
    return poses;
}

- (void)animate {
    
}

- (void)animateWithKeyPath:(NSString *)keyPath duration:(CFTimeInterval)duration times:(NSArray *)times values:(NSArray *)values {
    
    
    
}

- (void)animateStrokeHueWithDuration:(CFTimeInterval)duration {
    
    int count = 36;
    
    CAKeyframeAnimation * animation = [CAKeyframeAnimation animationWithKeyPath:@"strokeColor"];
//    NSMutableArray *keyTimes = [NSMutableArray array];
//
//    for(int i = 0; i <= count; i++) {
//        [CFTimeInterval indexSetWithIndex:i];
//        [keyTimes addObject:[NSNumber numberWithInteger: CFTimeInterval(i)/CFTimeInterval(count)]];
//    }
    
    NSInteger startIndex = 0;
    NSIndexSet *indexSet = [NSIndexSet indexSetWithIndexesInRange: NSMakeRange(startIndex, count + 1)];
    
    __block NSMutableArray<NSNumber *> * keyTimes = [NSMutableArray array];
    [indexSet enumerateIndexesUsingBlock:^(NSUInteger idx, BOOL * _Nonnull stop) {
        [keyTimes addObject: [NSNumber numberWithDouble: (double)idx / (double)count]];
    }];
    
    animation.keyTimes = keyTimes;
    
    NSMutableArray<UIColor *> * values = [NSMutableArray array];
    
    for (int i = 0; i <= count; i++) {
        [values addObject:[[UIColor alloc] initWithRed:33/255 green:191/255 blue:233/255 alpha:1.0]];
    }
    
    animation.values = values;
    animation.duration = duration;
    animation.calculationMode = kCAAnimationLinear;
    animation.repeatCount = INFINITY;
    [((CAShapeLayer *)[self layer]) addAnimation:animation forKey:animation.keyPath];
    
}

@end
