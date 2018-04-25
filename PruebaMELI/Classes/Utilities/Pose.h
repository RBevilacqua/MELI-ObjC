//
//  Pose.h
//  PruebaMELI
//
//  Created by Robert Bevilacqua on 25/4/18.
//  Copyright © 2018 Robert Bevilacqua. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Pose : NSObject

@property(nonatomic) CFTimeInterval secondsSincePriorPose;
@property(nonatomic) CGFloat start;
@property(nonatomic) CGFloat lenght;

@end
