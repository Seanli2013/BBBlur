//
//  ViewController.m
//  BBBlur
//
//  Created by Xiang LI on 11/26/14.
//  Copyright (c) 2014 Xiang LI. All rights reserved.
//

#import "ViewController.h"
#import "BBBlurView.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    BBBlurView *blurView = [[BBBlurView alloc] initWithFrame:self.view.frame withBlurStyle:BBBlurStyleDark];
    [self.view insertSubview:blurView aboveSubview:self.imageView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
