//
//  ViewController.m
//  Control Fun
//
//  Created by X on 19/11/15.
//  Copyright (c) 2015 Alex Izotov. All rights reserved.
//

#import "AIZMainViewController.h"
#import "AIZMainViewController+AIZImageView.h"
#import "AIZMainViewController+AIZLabels.h"
#import "AIZMainViewController+AIZTextFields.h"
#import "AIZMainViewController+AIZLabelAndSlider.h"
#import "AIZMainViewController+AIZSegmentedControl.h"
#import "AIZMainViewController+AIZSwitchesAndButton.h"

@implementation AIZMainViewController

- (void)loadView
{
    UIControl *view = [[UIControl alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    view.backgroundColor = [UIColor greenColor];

    [view addTarget:self
             action:@selector(backgroundTapped:)
   forControlEvents:UIControlEventTouchUpInside];

     self.view = view;
}

- (void)backgroundTapped:(id)sender
{
    [self.view endEditing:YES];
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    [self addImageView];
    [self addImageViewConstraints];

    [self addLabels];
    [self addLabelsConstraints];

    [self addTextFields];
    [self addTextFieldsConstraints];

    [self addLabelAndSlider];
    [self addLabelAndSliderConstraints];

    [self addSegmentedControl];
    [self addSegmentedControlConstraints];

    [self addSwitchesAndButton];
    [self addSwitchesAndButtonConstraints];
}

@end














