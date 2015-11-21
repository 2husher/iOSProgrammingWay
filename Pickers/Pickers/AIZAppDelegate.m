//
//  AIZAppDelegate.m
//  Pickers
//
//  Created by X on 21/11/15.
//  Copyright (c) 2015 Alex Izotov. All rights reserved.
//

#import "AIZAppDelegate.h"
#import "AIZDatePickerViewController.h"
#import "AIZSingleComponentPickerViewController.h"
#import "AIZDoubleComponentPickerViewController.h"
#import "AIZDependentComponentPickerViewController.h"
#import "AIZCustomPickerViewController.h"

@implementation AIZAppDelegate

- (BOOL)          application:(UIApplication *)application
didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc]
                   initWithFrame:[[UIScreen mainScreen] bounds]];

    

    self.tabBarController = [[UITabBarController alloc] init];

    AIZDatePickerViewController *datePickerVC = [[AIZDatePickerViewController alloc] init];
    AIZSingleComponentPickerViewController *singleComponentPickerVC = [[AIZSingleComponentPickerViewController alloc] init];
    AIZDoubleComponentPickerViewController *doubleComponentPickerVC = [[AIZDoubleComponentPickerViewController alloc] init];
    AIZDependentComponentPickerViewController *dependentComponentPickerVC = [[AIZDependentComponentPickerViewController alloc] init];
    AIZCustomPickerViewController *customPickerVC = [[AIZCustomPickerViewController alloc] init];

    self.tabBarController.viewControllers = @[datePickerVC,
                                              singleComponentPickerVC,
                                              doubleComponentPickerVC,
                                              dependentComponentPickerVC,
                                              customPickerVC];

    self.window.rootViewController = self.tabBarController;

    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

@end
