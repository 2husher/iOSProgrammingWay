//
//  AIZMainViewController+AIZTextFields.m
//  Control Fun
//
//  Created by X on 21/11/15.
//  Copyright (c) 2015 Alex Izotov. All rights reserved.
//

#import "AIZMainViewController+AIZTextFields.h"

@interface AIZMainViewController () <UITextFieldDelegate>

@end

@implementation AIZMainViewController (AIZTextFields)

- (void)addTextFields
{
    self.nameTextField = [[UITextField alloc] initWithFrame:CGRectZero];
    self.nameTextField.placeholder = @"Type in a name";
    self.nameTextField.borderStyle = UITextBorderStyleRoundedRect;
    self.nameTextField.returnKeyType = UIReturnKeyDone;

    self.nameTextField.delegate = self;

    self.numberTextField = [[UITextField alloc] initWithFrame:CGRectZero];
    self.numberTextField.placeholder = @"Type in a number";
    self.numberTextField.borderStyle = UITextBorderStyleRoundedRect;
    self.numberTextField.keyboardType = UIKeyboardTypeNumberPad;

    [self.view addSubview:self.nameTextField];
    [self.view addSubview:self.numberTextField];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

- (void)addTextFieldsConstraints
{
    self.nameTextField.translatesAutoresizingMaskIntoConstraints   = NO;
    self.numberTextField.translatesAutoresizingMaskIntoConstraints = NO;

    NSLayoutConstraint *verticalNameTextFieldConstraints =
    [NSLayoutConstraint constraintWithItem:self.nameTextField
                                 attribute:NSLayoutAttributeBaseline
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:self.nameLabel
                                 attribute:NSLayoutAttributeBaseline
                                multiplier:1.0f
                                  constant:0.0f];

    NSLayoutConstraint *verticalNumberTextFieldConstraints =
    [NSLayoutConstraint constraintWithItem:self.numberTextField
                                 attribute:NSLayoutAttributeBaseline
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:self.numberLabel
                                 attribute:NSLayoutAttributeBaseline
                                multiplier:1.0f
                                  constant:0.0f];

    [self.view addConstraints:@[verticalNameTextFieldConstraints,
                                verticalNumberTextFieldConstraints]];

    NSDictionary *nameMap = @{ @"nameLabel" : self.nameLabel,
                               @"numberLabel" : self.numberLabel,
                               @"nameTextField" : self.nameTextField,
                               @"numberTextField" : self.numberTextField };

    NSArray *horizontalNameTextFieldConstraints_1 =
    [NSLayoutConstraint constraintsWithVisualFormat:@"H:[nameTextField]-|"
                                            options:0
                                            metrics:nil
                                              views:nameMap];

    [self.view addConstraints:horizontalNameTextFieldConstraints_1];

    NSArray *horizontalNumberTextFieldConstraints =
    [NSLayoutConstraint constraintsWithVisualFormat:@"H:[numberLabel]-[numberTextField]-|"
                                            options:0
                                            metrics:nil
                                              views:nameMap];

    [self.view addConstraints:horizontalNumberTextFieldConstraints];

    NSArray *verticalConstraints =
    [NSLayoutConstraint constraintsWithVisualFormat:@"V:[nameTextField]-[numberTextField]"
                                            options:0
                                            metrics:nil
                                              views:nameMap];

    [self.view addConstraints:verticalConstraints];

    NSLayoutConstraint *horizontalNameTextFieldConstraints_2 =
    [NSLayoutConstraint constraintWithItem:self.nameTextField
                                 attribute:NSLayoutAttributeLeading
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:self.numberTextField
                                 attribute:NSLayoutAttributeLeading
                                multiplier:1.0f
                                  constant:0.0f];

    [self.view addConstraints:@[horizontalNameTextFieldConstraints_2]];
}

@end
