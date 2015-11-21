//
//  AIZYellowViewController.m
//  View Switcher
//
//  Created by X on 21/11/15.
//  Copyright (c) 2015 Alex Izotov. All rights reserved.
//

#import "AIZYellowViewController.h"

@interface AIZYellowViewController ()

@property (nonatomic, strong) UIButton *button;

@end

@implementation AIZYellowViewController

- (void)loadView
{
    UIView *view = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    view.backgroundColor = [UIColor yellowColor];
    self.view = view;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    [self addButton];
    [self addButtonConstraints];
}

- (void)addButton
{
    self.button = [UIButton buttonWithType:UIButtonTypeSystem];
    self.button.frame = CGRectZero;
    [self.button setTitle:@"Press Me, Too" forState:UIControlStateNormal];
    [self.button sizeToFit];

    [self.button addTarget:self
                    action:@selector(buttonPressed)
          forControlEvents:UIControlEventTouchUpInside];

    [self.view addSubview:self.button];
}

- (void)buttonPressed
{
    UIAlertController *alert =
    [UIAlertController alertControllerWithTitle:@"Attention!"
                                        message:@"You pressed a button."
                                 preferredStyle:UIAlertControllerStyleAlert];

    UIAlertAction *action =
    [UIAlertAction actionWithTitle:@"Yes, I did."
                             style:UIAlertActionStyleDefault
                           handler:nil];

    [alert addAction:action];

    [self presentViewController:alert animated:YES completion:nil];
}

- (void)addButtonConstraints
{
    self.button.translatesAutoresizingMaskIntoConstraints = NO;

    NSLayoutConstraint *centerXconstraint =
    [NSLayoutConstraint constraintWithItem:self.button
                                 attribute:NSLayoutAttributeCenterX
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:self.view
                                 attribute:NSLayoutAttributeCenterX
                                multiplier:1.0f
                                  constant:0.0f];

    NSLayoutConstraint *centerYconstraint =
    [NSLayoutConstraint constraintWithItem:self.button
                                 attribute:NSLayoutAttributeCenterY
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:self.view
                                 attribute:NSLayoutAttributeCenterY
                                multiplier:1.0f
                                  constant:0.0f];

    [self.view addConstraints:@[centerXconstraint, centerYconstraint]];
}

@end
