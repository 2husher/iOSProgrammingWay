//
//  AIZMainViewController+AIZSwitchesAndButton.m
//  Control Fun
//
//  Created by X on 21/11/15.
//  Copyright (c) 2015 Alex Izotov. All rights reserved.
//

#import "AIZMainViewController+AIZSwitchesAndButton.h"

@interface AIZMainViewController () <UIActionSheetDelegate>

@end

@implementation AIZMainViewController (AIZSwitchesAndButton)

- (void)addSwitchesAndButton
{
    self.leftSwitch = [[UISwitch alloc] initWithFrame:CGRectZero];
    self.rightSwitch = [[UISwitch alloc] initWithFrame:CGRectZero];

    [self.leftSwitch addTarget:self
                        action:@selector(switchChanged:)
              forControlEvents:UIControlEventValueChanged];

    [self.rightSwitch addTarget:self
                         action:@selector(switchChanged:)
               forControlEvents:UIControlEventValueChanged];

    self.button = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.button setBackgroundImage:[UIImage imageNamed:@"whiteButton"] forState:UIControlStateNormal];
    [self.button setBackgroundImage:[UIImage imageNamed:@"blueButton"] forState:UIControlStateHighlighted];
    [self.button setTitle:@"Do Something" forState:UIControlStateNormal];

    self.button.hidden = @"YES";
    [self.button addTarget:self
                    action:@selector(buttonPressed:)
          forControlEvents:UIControlEventTouchUpInside];

    [self.view addSubview:self.leftSwitch];
    [self.view addSubview:self.rightSwitch];
    [self.view addSubview:self.button];
}

- (void)switchChanged:(UISwitch *)sender
{
    BOOL settings = sender.isOn;
    [self.leftSwitch setOn:settings animated:YES];
    [self.rightSwitch setOn:settings animated:YES];
}

- (void)buttonPressed:(UIButton *)sender
{
    UIActionSheet *actionSheet = [[UIActionSheet alloc]
                                  initWithTitle:@"Are you sure?"
                                  delegate:self
                                  cancelButtonTitle:@"No Way!"
                                  destructiveButtonTitle:@"Yes, I'm Sure!"
                                  otherButtonTitles: nil];

    [actionSheet showInView:self.view];
}

- (void)actionSheet:(UIActionSheet *)actionSheet didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    if (buttonIndex != [actionSheet cancelButtonIndex])
    {
        NSString *msg = nil;

        if (self.nameTextField.text.length > 0)
        {
            msg = [NSString stringWithFormat:@"You can breathe easy, %@, everything went OK", self.nameTextField.text];
        }
        else
        {
            msg = @"You can breathe easy, everything went OK";
        }

        UIAlertView *alertView = [[UIAlertView alloc]
                                  initWithTitle:@"Something was done"
                                  message:msg
                                  delegate:self
                                  cancelButtonTitle:@"Phew!"
                                  otherButtonTitles: nil];
        [alertView show];
    }
}

- (void)addSwitchesAndButtonConstraints
{
    self.leftSwitch.translatesAutoresizingMaskIntoConstraints  = NO;
    self.rightSwitch.translatesAutoresizingMaskIntoConstraints = NO;
    self.button.translatesAutoresizingMaskIntoConstraints = NO;

    NSDictionary *nameMap = @{ @"segmentedControl" : self.segmentedControl,
                               @"rightSwitch" : self.rightSwitch,
                               @"leftSwitch" : self.leftSwitch,
                               @"button" : self.button };

    NSArray *verticalLeftSwitchConstraints =
    [NSLayoutConstraint constraintsWithVisualFormat:@"V:[segmentedControl]-50-[leftSwitch]"
                                            options:0
                                            metrics:nil
                                              views:nameMap];

    [self.view addConstraints:verticalLeftSwitchConstraints];

    NSLayoutConstraint *verticalRightSwitchConstraints =
    [NSLayoutConstraint constraintWithItem:self.rightSwitch
                                 attribute:NSLayoutAttributeCenterY
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:self.leftSwitch
                                 attribute:NSLayoutAttributeCenterY
                                multiplier:1.0f
                                  constant:0.0f];

    [self.view addConstraints:@[verticalRightSwitchConstraints]];

    NSArray *horizontalRightSwitchConstraints =
    [NSLayoutConstraint constraintsWithVisualFormat:@"H:[rightSwitch]-|"
                                            options:0
                                            metrics:nil
                                              views:nameMap];

    [self.view addConstraints:horizontalRightSwitchConstraints];

    NSArray *horizontalLeftSwitchConstraints =
    [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[leftSwitch]"
                                            options:0
                                            metrics:nil
                                              views:nameMap];

    [self.view addConstraints:horizontalLeftSwitchConstraints];

    NSLayoutConstraint *verticalButtonConstraints =
    [NSLayoutConstraint constraintWithItem:self.button
                                 attribute:NSLayoutAttributeCenterY
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:self.leftSwitch
                                 attribute:NSLayoutAttributeCenterY
                                multiplier:1.0f
                                  constant:0.0f];

    [self.view addConstraints:@[verticalButtonConstraints]];

    NSArray *horizontalButtonConstraints =
    [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[button]-|"
                                            options:0
                                            metrics:nil
                                              views:nameMap];

    [self.view addConstraints:horizontalButtonConstraints];
}

@end
