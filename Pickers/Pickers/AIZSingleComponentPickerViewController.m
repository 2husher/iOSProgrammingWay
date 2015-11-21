//
//  AIZSingleComponentPickerViewController.m
//  Pickers
//
//  Created by X on 21/11/15.
//  Copyright (c) 2015 Alex Izotov. All rights reserved.
//

#import "AIZSingleComponentPickerViewController.h"

@interface AIZSingleComponentPickerViewController () <UIPickerViewDataSource, UIPickerViewDelegate>

@property (nonatomic, strong) UIPickerView *singlePicker;
@property (nonatomic, strong) UIButton *button;

@property (nonatomic, strong) NSArray *characterNames;

@end

@implementation AIZSingleComponentPickerViewController

- (instancetype)init
{
    if (self = [super init])
    {
        self.title = @"Single";
        self.tabBarItem.image = [UIImage imageNamed:@"single"];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    [self addSinglePicker];
    [self addSinglePickerConstraints];

    [self addButton];
    [self addButtonConstraints];
}

- (void) addSinglePicker
{
    self.singlePicker = [[UIPickerView alloc] init];
    self.singlePicker.delegate = self;
    self.singlePicker.dataSource = self;

    self.characterNames = @[@"Luke", @"Leia", @"Han", @"Chewbacca",
                            @"Artoo", @"Threepio", @"Lando"];

    [self.view addSubview:self.singlePicker];
}

- (void) addSinglePickerConstraints
{
    self.singlePicker.translatesAutoresizingMaskIntoConstraints = NO;

    NSDictionary *nameMap = @{ @"singlePicker" : self.singlePicker };

    NSArray *horizontalConstraints =
    [NSLayoutConstraint constraintsWithVisualFormat:@"H:|[singlePicker]|"
                                            options:0
                                            metrics:nil
                                              views:nameMap];

    [self.view addConstraints:horizontalConstraints];

    NSArray *verticalConstraints =
    [NSLayoutConstraint constraintsWithVisualFormat:@"V:|[singlePicker]"
                                            options:0
                                            metrics:nil
                                              views:nameMap];

    [self.view addConstraints:verticalConstraints];
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return [self.characterNames count];
}

- (NSString *)pickerView:(UIPickerView *)pickerView
             titleForRow:(NSInteger)row
            forComponent:(NSInteger)component
{
    return self.characterNames[row];
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

- (void)buttonPressed
{
    NSInteger row = [self.singlePicker selectedRowInComponent:0];
    NSString *selected = self.characterNames[row];

    NSString *title = [NSString stringWithFormat:@"You selected %@", selected];

    UIAlertController *alert =
        [UIAlertController alertControllerWithTitle:title
                                            message:@"Thank you for choosing."
                                     preferredStyle:UIAlertControllerStyleAlert];

    UIAlertAction *action =
        [UIAlertAction actionWithTitle:@"You're Welcome"
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
