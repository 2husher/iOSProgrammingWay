//
//  ViewController.m
//  Control Fun
//
//  Created by X on 19/11/15.
//  Copyright (c) 2015 Alex Izotov. All rights reserved.
//

#import "AIZMainViewController.h"
#import "AIZMainViewController+AIZConstraints.h"

@interface AIZMainViewController () <UITextFieldDelegate, UIActionSheetDelegate>

@end

@implementation AIZMainViewController

- (void)loadView
{
    UIControl *view = [[UIControl alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    view.backgroundColor = [UIColor greenColor];

    [view addTarget:self
             action:@selector(backgroundTapped:)
   forControlEvents:UIControlEventTouchUpInside];

     self.view = view;
}

- (void)backgroundTapped:(id)sender
{
    [self.view endEditing:YES];
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

- (void)addSegmentedControl
{
    self.segmentedControl = [[UISegmentedControl alloc] initWithItems:@[@"Switches", @"Button"]];

    [self.segmentedControl addTarget:self
                              action:@selector(toggleControls:)
                    forControlEvents:UIControlEventValueChanged];

    [self.segmentedControl setSelectedSegmentIndex:0];

    [self.view addSubview:self.segmentedControl];
}

- (void)toggleControls:(UISegmentedControl *)sender
{
    if (sender.selectedSegmentIndex == 0)
    {
        self.leftSwitch.hidden = NO;
        self.rightSwitch.hidden = NO;
        self.button.hidden = YES;
    }
    else if (sender.selectedSegmentIndex == 1)
    {
        self.leftSwitch.hidden = YES;
        self.rightSwitch.hidden = YES;
        self.button.hidden = NO;
    }
}

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

@end














