//
//  ViewController.m
//  Control Fun
//
//  Created by X on 19/11/15.
//  Copyright (c) 2015 Alex Izotov. All rights reserved.
//

#import "AIZMainViewController.h"

@interface AIZMainViewController ()

@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UILabel *numberLabel;
@property (nonatomic, strong) UITextField *nameTextField;
@property (nonatomic, strong) UITextField *numberTextField;
@property (nonatomic, strong) UILabel *label;
@property (nonatomic, strong) UISlider *slider;
@property (nonatomic, strong) UISegmentedControl *segmentedControl;
@property (nonatomic, strong) UISwitch *leftSwitch;
@property (nonatomic, strong) UISwitch *rightSwitch;
@property (nonatomic, strong) UIButton *button;

@end

@implementation AIZMainViewController

- (void)loadView
{
    self.view = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.view.backgroundColor = [UIColor greenColor];
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    [self addImageView];
    [self addImageViewConstraints];

    [self addLabels];
    [self addLabelsConstraints];

    [self addTextFields];
    [self addTextFieldsConstraints];

    [self addLabelAndSlider];
    [self addLabelAndSliderConstraints];

    [self addSegmentedControl];
    [self addSegmentedControlConstraints];

    [self addSwitchesAndButton];
    [self addSwitchesAndButtonConstraints];
    
}

- (void)addImageView
{
    UIImage *image = [UIImage imageNamed:@"apress_logo"];
    self.imageView = [[UIImageView alloc] initWithImage:image];

    [self.view addSubview:self.imageView];
}

- (void)addImageViewConstraints
{
    self.imageView.translatesAutoresizingMaskIntoConstraints = NO;

    NSLayoutConstraint *horizontalConstraints =
        [NSLayoutConstraint constraintWithItem:self.imageView
                                     attribute:NSLayoutAttributeCenterX
                                     relatedBy:NSLayoutRelationEqual
                                        toItem:self.view
                                     attribute:NSLayoutAttributeCenterX
                                    multiplier:1.0f
                                      constant:0.0f];

    [self.view addConstraints:@[horizontalConstraints]];

    NSDictionary *nameMap = @{ @"imageView" : self.imageView };

    NSArray *verticalConstraints =
        [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-80-[imageView]"
                                                options:0
                                                metrics:nil
                                                  views:nameMap];

    [self.view addConstraints:verticalConstraints];
}

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

- (void)addTextFields
{
    self.nameTextField = [[UITextField alloc] initWithFrame:CGRectZero];
//    self.nameTextField.placeholder = @"Hello 1127tg5jdjkjsljfalsjdflajdfljalsdfjlajf";
    self.nameTextField.borderStyle = UITextBorderStyleRoundedRect;

    self.numberTextField = [[UITextField alloc] initWithFrame:CGRectZero];
//    self.numberTextField.placeholder = @"Bye";
    self.numberTextField.borderStyle = UITextBorderStyleRoundedRect;

    [self.view addSubview:self.nameTextField];
    [self.view addSubview:self.numberTextField];
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

- (void)addLabelAndSlider
{
    self.label = [[UILabel alloc] initWithFrame:CGRectZero];
    self.label.text = @"100";
    //self.label.backgroundColor = [UIColor grayColor];
    [self.label sizeToFit];

    self.slider = [[UISlider alloc] initWithFrame:CGRectZero];

    [self.view addSubview:self.label];
    [self.view addSubview:self.slider];
}

- (void)addLabelAndSliderConstraints
{
    self.label.translatesAutoresizingMaskIntoConstraints  = NO;
    self.slider.translatesAutoresizingMaskIntoConstraints = NO;

    NSDictionary *nameMap = @{ @"numberLabel" : self.numberLabel,
                               @"label" : self.label,
                               @"slider" : self.slider };

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
        [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[label]-[slider]-|"
                                                options:0
                                                metrics:nil
                                                  views:nameMap];


    [self.view addConstraints:horizontalConstraints];
}

- (void)addSegmentedControl
{
    self.segmentedControl = [[UISegmentedControl alloc] initWithItems:@[@"Switches", @"Button"]];

    [self.view addSubview:self.segmentedControl];
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

- (void)addSwitchesAndButton
{
    self.leftSwitch = [[UISwitch alloc] initWithFrame:CGRectZero];
    self.rightSwitch = [[UISwitch alloc] initWithFrame:CGRectZero];

    self.button = [UIButton buttonWithType:UIButtonTypeSystem];
    [self.button setTitle:@"Button" forState:UIControlStateNormal];
//    self.button.frame = CGRectZero;
//    self.button.backgroundColor = [UIColor grayColor];

    [self.view addSubview:self.leftSwitch];
    [self.view addSubview:self.rightSwitch];
    [self.view addSubview:self.button];
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
        [NSLayoutConstraint constraintsWithVisualFormat:@"V:[segmentedControl]-[leftSwitch]"
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














