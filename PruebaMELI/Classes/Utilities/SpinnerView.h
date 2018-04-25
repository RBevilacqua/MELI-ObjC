//
//  SpinnerView.h
//  PruebaMELI
//
//  Created by Robert Bevilacqua on 22/4/18.
//  Copyright © 2018 Robert Bevilacqua. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "Pose.h"

IB_DESIGNABLE
@interface SpinnerView : UIView

@property (nonatomic) IBInspectable UIColor * color;
@property (nonatomic) struct Pose * pose;



- (void)setPath;
+ (NSArray *)getPoses;
- (void)animate;
- (void)animateWithKeyPath:(NSString *)keyPath duration:(CFTimeInterval)duration times:(NSArray *)times values:(NSArray *)values;
- (void)animzateStrokeHueWithDuration:(CFTimeInterval)duration;

@end
