//
//  AIZMainViewController.m
//  TikiGoads
//
//  Created by X on 18/11/15.
//  Copyright (c) 2015 Alex Izotov. All rights reserved.
//

#import "AIZMainViewController.h"

@interface AIZMainViewController ()

@property (nonatomic, strong) UILabel *label;

@end

@implementation AIZMainViewController

- (void)loadView
{
    self.view = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.view.backgroundColor = [UIColor greenColor];
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    NSLog(@"self.view is %@", self.view);

    [self addLabel];
    [self addLabelConstraints];
}

- (void)addLabel
{
    CGRect frame = CGRectMake(0, 0, 0, 0);
    self.label = [[UILabel alloc] initWithFrame:frame];
    self.label.text = @"Hello, World";
    self.label.layer.borderColor = [UIColor brownColor].CGColor;
    self.label.layer.borderWidth = 1.0;
    [self.label sizeToFit];

    [self.view addSubview:self.label];
}

- (void)addLabelConstraints
{
    self.label.translatesAutoresizingMaskIntoConstraints = NO;

    NSLayoutConstraint *centerXconstraint =
        [NSLayoutConstraint constraintWithItem:self.label
                                     attribute:NSLayoutAttributeCenterX
                                     relatedBy:NSLayoutRelationEqual
                                        toItem:self.view
                                     attribute:NSLayoutAttributeCenterX
                                    multiplier:1.0f
                                      constant:0.0f];

    NSLayoutConstraint *centerYconstraint =
        [NSLayoutConstraint constraintWithItem:self.label
                                     attribute:NSLayoutAttributeCenterY
                                     relatedBy:NSLayoutRelationEqual
                                        toItem:self.view
                                     attribute:NSLayoutAttributeCenterY
                                    multiplier:1.0f
                                      constant:0.0f];

    [self.view addConstraints:@[centerXconstraint, centerYconstraint]];
}

@end
