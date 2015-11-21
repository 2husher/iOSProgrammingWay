//
//  AIZMainViewController+AIZImageView.m
//  Control Fun
//
//  Created by X on 21/11/15.
//  Copyright (c) 2015 Alex Izotov. All rights reserved.
//

#import "AIZMainViewController+AIZImageView.h"

@implementation AIZMainViewController (AIZImageView)

- (void)addImageView
{
    UIImage *image = [UIImage imageNamed:@"apress_logo"];
    self.imageView = [[UIImageView alloc] initWithImage:image];

    [self.view addSubview:self.imageView];
}

- (void)addImageViewConstraints
{
    self.imageView.translatesAutoresizingMaskIntoConstraints = NO;

    NSLayoutConstraint *horizontalConstraints =
    [NSLayoutConstraint constraintWithItem:self.imageView
                                 attribute:NSLayoutAttributeCenterX
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:self.view
                                 attribute:NSLayoutAttributeCenterX
                                multiplier:1.0f
                                  constant:0.0f];

    [self.view addConstraints:@[horizontalConstraints]];

    NSDictionary *nameMap = @{ @"imageView" : self.imageView };

    NSArray *verticalConstraints =
    [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-80-[imageView]"
                                            options:0
                                            metrics:nil
                                              views:nameMap];

    [self.view addConstraints:verticalConstraints];
}

@end
