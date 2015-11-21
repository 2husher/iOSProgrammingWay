//
//  AIZDependentComponentPickerViewController.m
//  Pickers
//
//  Created by X on 21/11/15.
//  Copyright (c) 2015 Alex Izotov. All rights reserved.
//

#import "AIZDependentComponentPickerViewController.h"

const NSInteger kStateComponent = 0;
const NSInteger kZipComponent   = 1;

@interface AIZDependentComponentPickerViewController () <UIPickerViewDelegate, UIPickerViewDataSource>

@property (nonatomic, strong) UIPickerView *dependentPicker;
@property (nonatomic, strong) UIButton *button;

@property (nonatomic, strong) NSDictionary *stateZips;
@property (nonatomic, strong) NSArray *states;
@property (nonatomic, strong) NSArray *zips;

@end

@implementation AIZDependentComponentPickerViewController

- (instancetype)init
{
    if (self = [super init])
    {
        self.title = @"Dependent";
        self.tabBarItem.image = [UIImage imageNamed:@"dependent"];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    NSBundle *bundle = [NSBundle mainBundle];
    NSURL *plistURL = [bundle URLForResource:@"statedictionary"
                               withExtension:@"plist"];

    self.stateZips = [NSDictionary dictionaryWithContentsOfURL:plistURL];

    NSArray *allStates = [self.stateZips allKeys];
    NSArray *sortedStates = [allStates sortedArrayUsingSelector:@selector(compare:)];
    self.states = sortedStates;

    NSString *selectedState = self.states[0];
    self.zips = self.stateZips[selectedState];

    [self addDependentPicker];
    [self addDependentPickerConstraints];

    [self addButton];
    [self addButtonConstraints];

}

- (void) addDependentPicker
{
    self.dependentPicker = [[UIPickerView alloc] init];
    self.dependentPicker.delegate   = self;
    self.dependentPicker.dataSource = self;

    [self.view addSubview:self.dependentPicker];
}

- (void) addDependentPickerConstraints
{
    self.dependentPicker.translatesAutoresizingMaskIntoConstraints = NO;

    NSDictionary *nameMap = @{ @"dependentPicker" : self.dependentPicker };

    NSArray *horizontalConstraints =
    [NSLayoutConstraint constraintsWithVisualFormat:@"H:|[dependentPicker]|"
                                            options:0
                                            metrics:nil
                                              views:nameMap];

    [self.view addConstraints:horizontalConstraints];

    NSArray *verticalConstraints =
    [NSLayoutConstraint constraintsWithVisualFormat:@"V:|[dependentPicker]"
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
    if (component == kStateComponent)
    {
        return [self.states count];
    }
    else if (component == kZipComponent)
    {
        return [self.zips count];
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
    if (component == kStateComponent)
    {
        return self.states[row];
    }
    else if (component == kZipComponent)
    {
        return self.zips[row];
    }
    else
    {
        return @"Wrong component";
    }
}

- (void)pickerView:(UIPickerView *)pickerView
      didSelectRow:(NSInteger)row
       inComponent:(NSInteger)component
{
    if (component == kStateComponent)
    {
        NSString *selectedState = self.states[row];
        self.zips = self.stateZips[selectedState];
        [self.dependentPicker reloadComponent:kZipComponent];
        [self.dependentPicker selectRow:0
                            inComponent:kZipComponent
                               animated:YES];
    }
}

- (CGFloat)pickerView:(UIPickerView *)pickerView
    widthForComponent:(NSInteger)component
{
    if (component == kZipComponent)
    {
        return 90;
    }
    else if (component == kStateComponent)
    {
        return 200;
    }
    else
    {
        return -1;
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
    NSInteger stateRow = [self.dependentPicker selectedRowInComponent:kStateComponent];
    NSInteger zipRow   = [self.dependentPicker selectedRowInComponent:kZipComponent];

    NSString *state = self.states[stateRow];
    NSString *zip   = self.zips[zipRow];

    NSString *title = [NSString stringWithFormat:@"You selected zip code %@.", zip];
    NSString *message = [NSString stringWithFormat:@"%@ in %@", zip, state];

    UIAlertController *alert =
        [UIAlertController alertControllerWithTitle:title
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
