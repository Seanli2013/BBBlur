//
//  BBBlurView.h
//  BBBlur
//
//  Created by Xiang LI on 11/26/14.
//  Copyright (c) 2014 Xiang LI. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BBBlurView : UIView
typedef NS_ENUM(NSInteger, BBBlurStyle)
{
    BBBlurStyleDefault = 0,
    BBBlurStyleWhite,
    BBBlurStyleDark,
    BBBlurStyleBright
};
- (id)initWithFrame:(CGRect)frame withBlurStyle:(BBBlurStyle)blurStyle;
@end
