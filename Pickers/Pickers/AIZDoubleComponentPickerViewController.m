//
//  AIZDoubleComponentPickerViewController.m
//  Pickers
//
//  Created by X on 21/11/15.
//  Copyright (c) 2015 Alex Izotov. All rights reserved.
//

#import "AIZDoubleComponentPickerViewController.h"

const NSInteger kFillingComponent = 0;
const NSInteger kBreadComponent   = 1;

@interface AIZDoubleComponentPickerViewController () <UIPickerViewDelegate, UIPickerViewDataSource>

@property (nonatomic, strong) UIPickerView *doublePicker;
@property (nonatomic, strong) UIButton *button;

@property (nonatomic, strong) NSArray *fillingTypes;
@property (nonatomic, strong) NSArray *breadTypes;

@end

@implementation AIZDoubleComponentPickerViewController

- (instancetype)init
{
    if (self = [super init])
    {
        self.title = @"Double";
        self.tabBarItem.image = [UIImage imageNamed:@"double"];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    [self addDoublePicker];
    [self addDoublePickerConstraints];

    [self addButton];
    [self addButtonConstraints];

}

- (void) addDoublePicker
{
    self.doublePicker = [[UIPickerView alloc] init];
    self.doublePicker.delegate   = self;
    self.doublePicker.dataSource = self;

    self.fillingTypes = @[@"Ham", @"Turkey", @"Peanut Butter", @"Tuna Salad",
                           @"Chicken Salad", @"Roast Beef", @"Vegemite"];

    self.breadTypes = @[@"White", @"Whole Wheat", @"Rye", @"Sourdough",
                         @"Seven Grain"];

    [self.view addSubview:self.doublePicker];
}

- (void) addDoublePickerConstraints
{
    self.doublePicker.translatesAutoresizingMaskIntoConstraints = NO;

    NSDictionary *nameMap = @{ @"doublePicker" : self.doublePicker };

    NSArray *horizontalConstraints =
    [NSLayoutConstraint constraintsWithVisualFormat:@"H:|[doublePicker]|"
                                            options:0
                                            metrics:nil
                                              views:nameMap];

    [self.view addConstraints:horizontalConstraints];

    NSArray *verticalConstraints =
    [NSLayoutConstraint constraintsWithVisualFormat:@"V:|[doublePicker]"
                                            options:0
                                            metrics:nil
                                              views:nameMap];

    [self.view addConstraints:verticalConstraints];
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 2;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView
numberOfRowsInComponent:(NSInteger)component
{
    if (component == kFillingComponent)
    {
        return [self.fillingTypes count];
    }
    else if (component == kBreadComponent)
    {
        return [self.breadTypes count];
    }
    else
    {
        return 0;
    }
}

- (NSString *)pickerView:(UIPickerView *)pickerView
             titleForRow:(NSInteger)row
            forComponent:(NSInteger)component
{
    if (component == kFillingComponent)
    {
        return self.fillingTypes[row];
    }
    else if (component == kBreadComponent)
    {
        return self.breadTypes[row];
    }
    else
    {
        return @"Wrong component";
    }
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
    NSInteger fillingRow = [self.doublePicker selectedRowInComponent:kFillingComponent];
    NSInteger breadRow   = [self.doublePicker selectedRowInComponent:kBreadComponent];

    NSString *filling = self.fillingTypes[fillingRow];
    NSString *bread   = self.breadTypes[breadRow];

    NSString *message = [NSString stringWithFormat:@"Your %@ on %@ bread will be right up.", filling, bread];

    UIAlertController *alert =
        [UIAlertController alertControllerWithTitle:@"Thank you for your order"
                                            message:message
                                     preferredStyle:UIAlertControllerStyleAlert];

    UIAlertAction *action =
        [UIAlertAction actionWithTitle:@"Great"
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
