//
//  AIZDatePickerViewController.m
//  Pickers
//
//  Created by X on 21/11/15.
//  Copyright (c) 2015 Alex Izotov. All rights reserved.
//

#import "AIZDatePickerViewController.h"

@interface AIZDatePickerViewController ()

@property (nonatomic, strong) UIDatePicker *datePicker;
@property (nonatomic, strong) UIButton *button;

@end

@implementation AIZDatePickerViewController

- (instancetype)init
{
    if (self = [super init])
    {
        self.title = @"Date";
        self.tabBarItem.image = [UIImage imageNamed:@"date"];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    [self addDatePicker];
    [self addDatePickerConstraints];

    [self addButton];
    [self addButtonConstraints];
}

- (void) addDatePicker
{
    self.datePicker = [[UIDatePicker alloc] init];

    [self.view addSubview:self.datePicker];
}

- (void)buttonPressed
{
    NSDate *selectedDate = [self.datePicker date];

    NSString *message = [NSString stringWithFormat:@"The date and time you selected is %@", selectedDate];

    UIAlertController *alert =
        [UIAlertController alertControllerWithTitle:@"Date and Time Selected"
                                            message:message
                                     preferredStyle:UIAlertControllerStyleAlert];

    UIAlertAction *action =
    [UIAlertAction actionWithTitle:@"That's so true!"
                             style:UIAlertActionStyleDefault
                           handler:nil];

    [alert addAction:action];

    [self presentViewController:alert animated:YES completion:nil];
}

- (void) addDatePickerConstraints
{
    self.datePicker.translatesAutoresizingMaskIntoConstraints = NO;

    NSDictionary *nameMap = @{ @"datePicker" : self.datePicker };

    NSArray *horizontalConstraints =
    [NSLayoutConstraint constraintsWithVisualFormat:@"H:|[datePicker]|"
                                            options:0
                                            metrics:nil
                                              views:nameMap];

    [self.view addConstraints:horizontalConstraints];

    NSArray *verticalConstraints =
    [NSLayoutConstraint constraintsWithVisualFormat:@"V:|[datePicker]"
                                            options:0
                                            metrics:nil
                                              views:nameMap];

    [self.view addConstraints:verticalConstraints];
}

- (void)addButton
{
    self.button = [UIButton buttonWithType:UIButtonTypeSystem];
    self.button.frame = CGRectZero;
    [self.button setTitle:@"Select" forState:UIControlStateNormal];
    [self.button sizeToFit];

    [self.button addTarget:self
                    action:@selector(buttonPressed)
          forControlEvents:UIControlEventTouchUpInside];

    [self.view addSubview:self.button];
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













