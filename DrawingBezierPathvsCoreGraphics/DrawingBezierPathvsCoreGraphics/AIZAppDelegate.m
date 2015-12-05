//
//  AIZAppDelegate.m
//  DrawingBezierPathvsCoreGraphics
//
//  Created by X on 05/12/15.
//  Copyright (c) 2015 Alex Izotov. All rights reserved.
//

#import "AIZAppDelegate.h"
#import "AIZDrawingBezierPathViewController.h"
#import "AIZDrawingCoreGraphicsViewController.h"

@implementation AIZAppDelegate

- (BOOL)          application:(UIApplication *)application
didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc]
                   initWithFrame:[[UIScreen mainScreen] bounds]];

    self.tabBarController = [[UITabBarController alloc] init];

    AIZDrawingBezierPathViewController *bezierPathVC =
        [[AIZDrawingBezierPathViewController alloc] init];
    AIZDrawingCoreGraphicsViewController *coreGraphicsVC =
        [[AIZDrawingCoreGraphicsViewController alloc] init];

    self.tabBarController.viewControllers = @[bezierPathVC,
                                              coreGraphicsVC];
    self.window.rootViewController = self.tabBarController;

    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

@end
