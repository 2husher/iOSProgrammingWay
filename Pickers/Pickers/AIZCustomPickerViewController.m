//
//  AIZCustomPickerViewController.m
//  Pickers
//
//  Created by X on 21/11/15.
//  Copyright (c) 2015 Alex Izotov. All rights reserved.
//

#import "AIZCustomPickerViewController.h"

@interface AIZCustomPickerViewController () <UIPickerViewDelegate, UIPickerViewDataSource>

@property (nonatomic, strong) UIPickerView *customPicker;
@property (nonatomic, strong) UILabel *label;
@property (nonatomic, strong) UIButton *button;

@property (nonatomic, strong) NSArray *images;

@end

@implementation AIZCustomPickerViewController

- (instancetype)init
{
    if (self = [super init])
    {
        self.title = @"Custom";
        self.tabBarItem.image = [UIImage imageNamed:@"custom"];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.images = @[[UIImage imageNamed:@"seven"],
                    [UIImage imageNamed:@"bar"],
                    [UIImage imageNamed:@"crown"],
                    [UIImage imageNamed:@"cherry"],
                    [UIImage imageNamed:@"lemon"],
                    [UIImage imageNamed:@"apple"]];

    [self addCustomPicker];
    [self addCustomPickerConstraints];

    [self addLabel];
    [self addLabelConstraints];

    [self addButton];
    [self addButtonConstraints];

    srandom(time(NULL));
}

- (void) addCustomPicker
{
    self.customPicker = [[UIPickerView alloc] init];
    self.customPicker.delegate   = self;
    self.customPicker.dataSource = self;

    [self.view addSubview:self.customPicker];
}

- (void) addCustomPickerConstraints
{
    self.customPicker.translatesAutoresizingMaskIntoConstraints = NO;

    NSDictionary *nameMap = @{ @"customPicker" : self.customPicker };

    NSArray *horizontalConstraints =
    [NSLayoutConstraint constraintsWithVisualFormat:@"H:|[customPicker]|"
                                            options:0
                                            metrics:nil
                                              views:nameMap];

    [self.view addConstraints:horizontalConstraints];

    NSArray *verticalConstraints =
    [NSLayoutConstraint constraintsWithVisualFormat:@"V:|[customPicker]"
                                            options:0
                                            metrics:nil
                                              views:nameMap];

    [self.view addConstraints:verticalConstraints];
}

- (void)addLabel
{
    self.label = [[UILabel alloc] initWithFrame:CGRectZero];
    self.label.textAlignment = NSTextAlignmentCenter;
    self.label.font = [UIFont systemFontOfSize:30.0f];

    [self.view addSubview:self.label];
}

- (void)addLabelConstraints
{
    self.label.translatesAutoresizingMaskIntoConstraints = NO;
    NSDictionary *nameMap = @{ @"label" : self.label,
                               @"customPicker" : self.customPicker };

    NSArray *horizontalConstraints =
        [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[label]-|"
                                                options:0
                                                metrics:nil
                                                  views:nameMap];

    NSArray *verticalConstraints =
        [NSLayoutConstraint constraintsWithVisualFormat:@"V:[customPicker]-50-[label]"
                                                options:0
                                                metrics:nil
                                                  views:nameMap];

    [self.view addConstraints:horizontalConstraints];
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

- (void)buttonPressed
{
    BOOL win = NO;
    NSInteger numInRow = 1;
    NSInteger lastVal  = -1;

    for (NSInteger i = 0; i < 5; i++)
    {
        NSInteger newVal = random() % [self.images count];

        if (newVal == lastVal)
        {
            numInRow++;
        }
        else
        {
            numInRow = 1;
        }
        lastVal = newVal;

        [self.customPicker selectRow:newVal inComponent:i animated:YES];
        [self.customPicker reloadComponent:i];

        if (numInRow >= 3)
        {
            win = YES;
        }
    }
    
    if (win)
    {
        self.label.text = @"WIN!";
    }
    else
    {
        self.label.text = @"";
    }
}

- (void)addButtonConstraints
{
    self.button.translatesAutoresizingMaskIntoConstraints = NO;

    NSDictionary *nameMap = @{ @"label" : self.label,
                               @"button" : self.button };

    NSArray *verticalConstraints =
    [NSLayoutConstraint constraintsWithVisualFormat:@"V:[label]-50-[button]"
                                            options:0
                                            metrics:nil
                                              views:nameMap];

    [self.view addConstraints:verticalConstraints];

    NSLayoutConstraint *centerXconstraint =
    [NSLayoutConstraint constraintWithItem:self.button
                                 attribute:NSLayoutAttributeCenterX
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:self.view
                                 attribute:NSLayoutAttributeCenterX
                                multiplier:1.0f
                                  constant:0.0f];

    [self.view addConstraints:@[centerXconstraint]];
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 5;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView
numberOfRowsInComponent:(NSInteger)component
{
    return [self.images count];
}

-(UIView *)pickerView:(UIPickerView *)pickerView
           viewForRow:(NSInteger)row
         forComponent:(NSInteger)component
          reusingView:(UIView *)view
{
    UIImage *image = self.images[row];
    UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
    return imageView;
}

@end
