//
//  Message.h
//  PruebaMELI
//
//  Created by Robert Bevilacqua on 21/4/18.
//  Copyright © 2018 Robert Bevilacqua. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, TypeMessage) {
    success,
    warning
};


@interface Message : UIView

@property (weak, nonatomic) IBOutlet UIView *contentMessage;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (nonatomic) float value;

- (void)loadViewFromNib:(NSString *)nibName;
+ (void)showWithText:(NSString *)text type:(TypeMessage)type completion:(void(^_Nullable)(void)) completion;
- (void)configureMessageWithType:(TypeMessage)type;

@end
