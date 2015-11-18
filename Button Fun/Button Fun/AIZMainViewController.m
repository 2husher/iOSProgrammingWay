//
//  AIZMainViewController.m
//  Button Fun
//
//  Created by X on 19/11/15.
//  Copyright (c) 2015 Alex Izotov. All rights reserved.
//

#import "AIZMainViewController.h"

@interface AIZMainViewController ()

@property (nonatomic, strong) UILabel *label;
@property (nonatomic, strong) UIButton *leftButton;
@property (nonatomic, strong) UIButton *rightButton;

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

    [self addLabel];
    [self addLabelConstraints];

    [self addButtons];
    [self addButtonsConstraints];
}

- (void)addLabel
{
    self.label = [[UILabel alloc] initWithFrame:CGRectZero];
//    self.label.backgroundColor = [UIColor grayColor];
    self.label.text = @"This is a life";
    self.label.textAlignment = NSTextAlignmentCenter;
    [self.label sizeToFit];

    [self.view addSubview:self.label];
}

- (void)addLabelConstraints
{
    self.label.translatesAutoresizingMaskIntoConstraints = NO;
    NSDictionary *nameMap = @{ @"label" : self.label };

    NSArray *horizontalConstraints =
        [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[label]-|"
                                                options:0
                                                metrics:nil
                                                  views:nameMap];

    NSLayoutConstraint *verticalConstraint =
        [NSLayoutConstraint constraintWithItem:self.label
                                     attribute:NSLayoutAttributeCenterY
                                     relatedBy:NSLayoutRelationEqual
                                        toItem:self.view
                                     attribute:NSLayoutAttributeCenterY
                                    multiplier:1.0f
                                      constant:-100.0f];

    [self.view addConstraints:horizontalConstraints];
    [self.view addConstraints:@[verticalConstraint]];
}

- (void)addButtons
{
    self.leftButton = [UIButton buttonWithType:UIButtonTypeSystem];
    self.leftButton.frame = CGRectZero;
    [self.leftButton setTitle:@"Left" forState:UIControlStateNormal];
    [self.leftButton sizeToFit];
//    self.leftButton.backgroundColor = [UIColor grayColor];

    self.rightButton = [UIButton buttonWithType:UIButtonTypeSystem];
    self.rightButton.frame = CGRectZero;
    [self.rightButton setTitle:@"Right" forState:UIControlStateNormal];
    [self.rightButton sizeToFit];
//    self.rightButton.backgroundColor = [UIColor grayColor];

    [self.view addSubview:self.leftButton];
    [self.view addSubview:self.rightButton];

    [self.leftButton addTarget:self
                        action:@selector(buttonPressed:)
              forControlEvents:UIControlEventTouchUpInside];

    [self.rightButton addTarget:self
                        action:@selector(buttonPressed:)
              forControlEvents:UIControlEventTouchUpInside];

}

- (void) buttonPressed:(UIButton *)sender
{
    NSString *title = [sender titleForState:UIControlStateNormal];
    NSString *labelText = [NSString stringWithFormat:@"%@ button pressed.", title];
    self.label.text = labelText;
}

- (void) addButtonsConstraints
{
    self.leftButton.translatesAutoresizingMaskIntoConstraints  = NO;
    self.rightButton.translatesAutoresizingMaskIntoConstraints = NO;

    NSDictionary *nameMap = @{ @"leftButton" : self.leftButton,
                               @"rightButton" : self.rightButton };

    NSArray *horizontalLeftButtonConstraints =
        [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[leftButton]"
                                                options:0
                                                metrics:nil
                                                  views:nameMap];

    NSArray *horizontalRightButtonConstraints =
        [NSLayoutConstraint constraintsWithVisualFormat:@"H:[rightButton]-|"
                                                options:0
                                                metrics:nil
                                                  views:nameMap];

    NSLayoutConstraint *verticalLeftButtonConstraints =
        [NSLayoutConstraint constraintWithItem:self.leftButton
                                     attribute:NSLayoutAttributeCenterY
                                     relatedBy:NSLayoutRelationEqual
                                        toItem:self.view
                                     attribute:NSLayoutAttributeCenterY
                                    multiplier:1.0f
                                      constant:50.0f];

    NSLayoutConstraint *verticalRightButtonConstraints =
        [NSLayoutConstraint constraintWithItem:self.rightButton
                                     attribute:NSLayoutAttributeCenterY
                                     relatedBy:NSLayoutRelationEqual
                                        toItem:self.view
                                     attribute:NSLayoutAttributeCenterY
                                    multiplier:1.0f
                                      constant:50.0f];

    [self.view addConstraints:horizontalLeftButtonConstraints];
    [self.view addConstraints:horizontalRightButtonConstraints];

    [self.view addConstraints:@[verticalLeftButtonConstraints,
                                verticalRightButtonConstraints]];

}

@end