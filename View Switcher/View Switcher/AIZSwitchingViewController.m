//
//  AIZSwitchingViewController.m
//  View Switcher
//
//  Created by X on 21/11/15.
//  Copyright (c) 2015 Alex Izotov. All rights reserved.
//

#import "AIZSwitchingViewController.h"
#import "AIZYellowViewController.h"
#import "AIZBlueViewController.h"

@interface AIZSwitchingViewController ()

@property (nonatomic, strong) AIZYellowViewController *yellowViewController;
@property (nonatomic, strong) AIZBlueViewController *blueViewController;
@property (nonatomic, strong) UIToolbar *toolBar;

@end

@implementation AIZSwitchingViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    [self addToolBar];
    [self addToolBarConstraints];
    

    self.blueViewController = [[AIZBlueViewController alloc] init];
    [self switchViewsFromController:nil toController:self.blueViewController];
}


- (void)addToolBar
{
    self.toolBar = [[UIToolbar alloc] initWithFrame:CGRectZero];

    UIBarButtonItem *switchViews =
        [[UIBarButtonItem alloc] initWithTitle:@"Switch Views"
                                         style:UIBarButtonItemStylePlain
                                        target:self
                                        action:@selector(switchViews)];

    self.toolBar.items = @[switchViews];

    [self.view addSubview:self.toolBar];
}

- (void)addToolBarConstraints
{
    self.toolBar.translatesAutoresizingMaskIntoConstraints = NO;

    NSDictionary *nameMap = @{ @"toolBar" : self.toolBar };

    NSArray *horizontalConstraints =
        [NSLayoutConstraint constraintsWithVisualFormat:@"H:|[toolBar]|"
                                                options:0
                                                metrics:nil
                                                  views:nameMap];

    [self.view addConstraints:horizontalConstraints];

    NSArray *verticalConstraints =
        [NSLayoutConstraint constraintsWithVisualFormat:@"V:[toolBar(==44)]|"
                                                options:0
                                                metrics:nil
                                                  views:nameMap];

    [self.view addConstraints:verticalConstraints];
}

- (void)switchViews
{
    [UIView beginAnimations:@"View Flip" context:nil];
    [UIView setAnimationDuration:0.4];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];

    if (self.blueViewController.view.superview)
    {
        [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromRight
                               forView:self.view
                                 cache:YES];

        self.yellowViewController = [[AIZYellowViewController alloc] init];

        [self switchViewsFromController:self.blueViewController
                           toController:self.yellowViewController];

        self.blueViewController = nil;
    }
    else
    {
        [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft
                               forView:self.view
                                 cache:YES];

        self.blueViewController = [[AIZBlueViewController alloc] init];

        [self switchViewsFromController:self.yellowViewController
                           toController:self.blueViewController];

        self.yellowViewController = nil;
    }

    [UIView commitAnimations];
}

- (void)switchViewsFromController:(UIViewController *)fromVC
                     toController:(UIViewController *)toVC
{
    if (fromVC)
    {
        [fromVC willMoveToParentViewController:nil];
        [fromVC.view removeFromSuperview];
        [fromVC removeFromParentViewController];
    }

    if (toVC)
    {
        [self addChildViewController:toVC];
        [self.view insertSubview:toVC.view atIndex:0];
        [toVC didMoveToParentViewController:self];
    }
}

@end
