//
//  BBBlurView.m
//  BBBlur
//
//  Created by Xiang LI on 11/26/14.
//  Copyright (c) 2014 Xiang LI. All rights reserved.
//

#import "BBBlurView.h"
#import "DeviceInfo.h"
#import <UIKit/UIKit.h>
@interface BBBlurView ()
@property (nonatomic, strong) UIVisualEffectView *blurEffectView;

@end

@implementation BBBlurView


//- (void)awakeFromNib
//{
//    [super awakeFromNib];
//    [self frame];
//    if ([DeviceInfo isIOS7]) {
//        [self iOS7Blur:self.frame];
//    }
//    else if ([DeviceInfo iOS8OrHigher])
//    {
//        [self iOS8Blur:self.frame];
//    }
//    else{
//        NSLog(@"Not IOS7 OR IOS8!");
//    }
//}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        if ([DeviceInfo isIOS7]) {
            [self iOS7Blur:frame withBlurStyle:BBBlurStyleDefault];
        }
        else if ([DeviceInfo iOS8OrHigher])
        {
            [self iOS8Blur:frame withBlurStyle:BBBlurStyleDefault];
        }
        else{
            NSLog(@"ERROR: Not IOS7 OR IOS8!");
        }

    }
    
    return self;
}

- (id)initWithFrame:(CGRect)frame withBlurStyle:(BBBlurStyle)blurStyle
{
    self = [super initWithFrame:frame];
    if (self) {
        if ([DeviceInfo isIOS7]) {
            [self iOS7Blur:frame withBlurStyle:blurStyle];
        }
        else if ([DeviceInfo iOS8OrHigher])
        {
            [self iOS8Blur:frame withBlurStyle:blurStyle];
        }
        else{
            NSLog(@"ERROR: Not IOS7 OR IOS8!");
        }
        
    }
    
    return self;

}


#pragma mark - Functions

- (void)iOS7Blur:(CGRect)frame withBlurStyle:(BBBlurStyle)blurStyle
{
    UIView *newView = [[UIView alloc] initWithFrame:frame];
    newView.backgroundColor = [UIColor clearColor];
    UIToolbar *nativeBlurView = [[UIToolbar alloc] initWithFrame:frame];
    nativeBlurView.barStyle = [self iOS7BlurStyle:blurStyle];
    [newView.layer insertSublayer:nativeBlurView.layer atIndex:0];
    [self addSubview:newView];
}

- (void)iOS8Blur:(CGRect)frame withBlurStyle:(BBBlurStyle)blurStyle
{
    self.blurEffectView = [[UIVisualEffectView alloc] initWithEffect:[UIBlurEffect effectWithStyle:[self iOS8BlurStyle:blurStyle]]];
    self.blurEffectView.frame = frame;
    [self addSubview:self.blurEffectView];
}

- (UIBlurEffectStyle)iOS8BlurStyle:(BBBlurStyle)blurStyle
{
    UIBlurEffectStyle style;
    switch (blurStyle) {
        case BBBlurStyleDark:
            style = UIBlurEffectStyleDark;
            break;
        case BBBlurStyleWhite:
            style = UIBlurEffectStyleExtraLight;
            break;
        default:
        case BBBlurStyleDefault:
        case BBBlurStyleBright:
            style = UIBlurEffectStyleLight;
            break;
    }
    return style;
}

- (UIBarStyle)iOS7BlurStyle:(BBBlurStyle)blurStyle
{
    UIBarStyle style;
    switch (blurStyle) {
        case BBBlurStyleDark:
        case BBBlurStyleDefault:
            style = UIBarStyleBlack;
            break;
        default:
        case BBBlurStyleBright:
        case BBBlurStyleWhite:
            style = UIBarStyleDefault;
            break;
    }

    return style;
}

@end
