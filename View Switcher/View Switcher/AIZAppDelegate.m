//
//  AIZAppDelegate.m
//  View Switcher
//
//  Created by X on 21/11/15.
//  Copyright (c) 2015 Alex Izotov. All rights reserved.
//

#import "AIZAppDelegate.h"
#import "AIZSwitchingViewController.h"

@implementation AIZAppDelegate

- (BOOL)          application:(UIApplication *)application
didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc]
                   initWithFrame:[[UIScreen mainScreen] bounds]];

    self.switchingViewController = [[AIZSwitchingViewController alloc]
                           initWithNibName: nil
                           bundle:nil];
    self.window.rootViewController = self.switchingViewController;

    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

@end
