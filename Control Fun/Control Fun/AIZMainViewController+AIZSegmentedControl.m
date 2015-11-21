//
//  AIZMainViewController+AIZSegmentedControl.m
//  Control Fun
//
//  Created by X on 21/11/15.
//  Copyright (c) 2015 Alex Izotov. All rights reserved.
//

#import "AIZMainViewController+AIZSegmentedControl.h"

@implementation AIZMainViewController (AIZSegmentedControl)

- (void)addSegmentedControl
{
    self.segmentedControl = [[UISegmentedControl alloc] initWithItems:@[@"Switches", @"Button"]];

    [self.segmentedControl addTarget:self
                              action:@selector(toggleControls:)
                    forControlEvents:UIControlEventValueChanged];

    [self.segmentedControl setSelectedSegmentIndex:0];

    [self.view addSubview:self.segmentedControl];
}

- (void)toggleControls:(UISegmentedControl *)sender
{
    if (sender.selectedSegmentIndex == 0)
    {
        self.leftSwitch.hidden = NO;
        self.rightSwitch.hidden = NO;
        self.button.hidden = YES;
    }
    else if (sender.selectedSegmentIndex == 1)
    {
        self.leftSwitch.hidden = YES;
        self.rightSwitch.hidden = YES;
        self.button.hidden = NO;
    }
}

- (void)addSegmentedControlConstraints
{
    self.segmentedControl.translatesAutoresizingMaskIntoConstraints = NO;

    NSDictionary *nameMap = @{ @"label" : self.label,
                               @"segmentedControl" : self.segmentedControl };

    NSArray *verticalConstraints =
    [NSLayoutConstraint constraintsWithVisualFormat:@"V:[label]-50-[segmentedControl]"
                                            options:0
                                            metrics:nil
                                              views:nameMap];

    [self.view addConstraints:verticalConstraints];

    NSArray *horizontalConstraints =
    [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[segmentedControl]-|"
                                            options:0
                                            metrics:nil
                                              views:nameMap];

    [self.view addConstraints:horizontalConstraints];
}

@end
