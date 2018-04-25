//
//  Message.m
//  PruebaMELI
//
//  Created by Robert Bevilacqua on 21/4/18.
//  Copyright © 2018 Robert Bevilacqua. All rights reserved.
//

#import "Message.h"

@implementation Message

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    return [super initWithCoder:aDecoder];
}

- (instancetype)init {
    
   self.value = [[UIScreen mainScreen] bounds].size.height >= 812 ? 100 : 70;
    
    CGRect frame = CGRectMake(0, -self.value, [[UIScreen mainScreen] bounds].size.width, self.value);
    self = [super initWithFrame:frame];
    if (self) {
        [self loadViewFromNib:@"Message"];
    }
    return self;
}

- (void)configureMessageWithType:(TypeMessage)type {
    UIImage * image;
    if (type == success) {
        image = [[UIImage imageNamed:@""] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
        self.imageView.tintColor = [UIColor colorWithRed:75/255.f green:181/255.f blue:67/255.f alpha:1.0];
        self.contentMessage.backgroundColor = [UIColor colorWithRed:104/255.f green:104/255.f blue:104/255.f alpha:1.0];
        
    } else {
        image = [[UIImage imageNamed:@""] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
        self.imageView.tintColor = [UIColor colorWithRed:255/255.f green:294/255.f blue:0/255.f alpha:1.0];
        self.contentMessage.backgroundColor = [UIColor colorWithRed:104/255.f green:104/255.f blue:104/255.f alpha:1.0];
        
    }
    
    self.imageView.contentMode = UIViewContentModeScaleAspectFit;
    self.imageView.image = image;
}

+ (void)showWithText:(NSString *)text type:(TypeMessage)type completion:(void (^)(void))completion {
    Message * message = [[Message alloc] init];
    
    [message.titleLabel setText:text];
    [message configureMessageWithType:type];
    
    [UIApplication.sharedApplication.keyWindow addSubview:message];
    
    
    [UIView animateWithDuration:0.8 animations:^{
        CGRect frame = message.frame;
        frame.origin.y = 0;
        message.frame = frame;
        
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.8 delay:2.0 options:UIViewAnimationOptionAllowAnimatedContent animations:^{
            CGRect frame = message.frame;
            frame.origin.y = [[UIScreen mainScreen] bounds].size.height >= 812 ? -100 : -70;
            message.frame = frame;
            
        } completion:^(BOOL finished) {
            [message removeFromSuperview];
            if (completion != nil) {
                completion();
            }
            
        }];
        
    }];
    
    
}

- (void)loadViewFromNib:(NSString *)nibName {
    NSBundle *bundle = [NSBundle bundleForClass:self.class];
    Message * view = (Message *)[[bundle loadNibNamed:nibName owner:self options:nil] firstObject];
    view.frame = [self bounds];
    view.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [self addSubview:view];
}

@end
