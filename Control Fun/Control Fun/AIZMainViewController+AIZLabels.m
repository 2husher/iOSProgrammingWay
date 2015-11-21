//
//  AIZMainViewController+AIZLabels.m
//  Control Fun
//
//  Created by X on 21/11/15.
//  Copyright (c) 2015 Alex Izotov. All rights reserved.
//

#import "AIZMainViewController+AIZLabels.h"

@implementation AIZMainViewController (AIZLabels)

- (void)addLabels
{
    self.nameLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    self.nameLabel.text = @"Name:";
    //    self.nameLabel.backgroundColor = [UIColor grayColor];
    [self.nameLabel sizeToFit];

    [self.view addSubview:self.nameLabel];

    self.numberLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    self.numberLabel.text = @"Number:";
    //    self.numberLabel.backgroundColor = [UIColor grayColor];
    [self.numberLabel sizeToFit];

    [self.view addSubview:self.numberLabel];
    
}

- (void)addLabelsConstraints
{
    self.nameLabel.translatesAutoresizingMaskIntoConstraints   = NO;
    self.numberLabel.translatesAutoresizingMaskIntoConstraints = NO;

    [self.nameLabel setContentHuggingPriority:300.0f forAxis:UILayoutConstraintAxisHorizontal];
    [self.numberLabel setContentHuggingPriority:300.0f forAxis:UILayoutConstraintAxisHorizontal];

    NSDictionary *nameMap = @{ @"imageView" : self.imageView,
                               @"nameLabel" : self.nameLabel,
                               @"numberLabel" : self.numberLabel };

    NSArray *verticalConstraints =
    [NSLayoutConstraint constraintsWithVisualFormat:@"V:[imageView]-50-[nameLabel]"
                                            options:0
                                            metrics:nil
                                              views:nameMap];

    [self.view addConstraints:verticalConstraints];

    NSArray *horizontalNameLabelConstraints =
    [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[numberLabel]"
                                            options:0
                                            metrics:nil
                                              views:nameMap];

    [self.view addConstraints:horizontalNameLabelConstraints];

    NSLayoutConstraint *horizontalNumberLabelConstraints =
    [NSLayoutConstraint constraintWithItem:self.numberLabel
                                 attribute:NSLayoutAttributeTrailing
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:self.nameLabel
                                 attribute:NSLayoutAttributeTrailing
                                multiplier:1.0f
                                  constant:0.0f];

    [self.view addConstraints:@[horizontalNumberLabelConstraints]];
}

@end
