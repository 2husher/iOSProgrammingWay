//
//  AIZMainViewController+AIZLabelAndSlider.m
//  Control Fun
//
//  Created by X on 21/11/15.
//  Copyright (c) 2015 Alex Izotov. All rights reserved.
//

#import "AIZMainViewController+AIZLabelAndSlider.h"

@implementation AIZMainViewController (AIZLabelAndSlider)

- (void)addLabelAndSlider
{
    self.label = [[UILabel alloc] initWithFrame:CGRectZero];
    self.label.text = @"100";
    //self.label.backgroundColor = [UIColor grayColor];
    [self.label sizeToFit];

    self.slider = [[UISlider alloc] initWithFrame:CGRectZero];
    self.slider.minimumValue = 0.0f;
    self.slider.maximumValue = 100.0f;
    self.slider.value = self.slider.maximumValue / 2.0f;

    self.label.text = @"50";

    [self.slider addTarget:self
                    action:@selector(sliderChanged:)
          forControlEvents:UIControlEventValueChanged];

    [self.view addSubview:self.label];
    [self.view addSubview:self.slider];
}

- (void)sliderChanged:(UISlider *)sender
{
    NSInteger progress = lround(sender.value);
    self.label.text = [NSString stringWithFormat:@"%ld", progress];
}

- (void)addLabelAndSliderConstraints
{
    self.label.translatesAutoresizingMaskIntoConstraints  = NO;
    self.slider.translatesAutoresizingMaskIntoConstraints = NO;

    NSDictionary *nameMap = @{ @"numberLabel" : self.numberLabel,
                               @"label" : self.label,
                               @"slider" : self.slider };
    NSDictionary *metrics = @{ @"labelWidth" : @(self.label.frame.size.width) };

    NSArray *verticalLabelConstraints =
    [NSLayoutConstraint constraintsWithVisualFormat:@"V:[numberLabel]-50-[label]"
                                            options:0
                                            metrics:nil
                                              views:nameMap];

    [self.view addConstraints:verticalLabelConstraints];

    NSLayoutConstraint *verticalSliderConstraints =
    [NSLayoutConstraint constraintWithItem:self.label
                                 attribute:NSLayoutAttributeCenterY
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:self.slider
                                 attribute:NSLayoutAttributeCenterY
                                multiplier:1.0f
                                  constant:0.0f];

    [self.view addConstraints:@[verticalSliderConstraints]];

    NSArray *horizontalConstraints =
    [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[label(labelWidth)]-[slider]-|"
                                            options:0
                                            metrics:metrics
                                              views:nameMap];


    [self.view addConstraints:horizontalConstraints];
}

@end
