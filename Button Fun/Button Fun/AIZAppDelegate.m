//
//  AIZAppDelegate.m
//  Button Fun
//
//  Created by X on 19/11/15.
//  Copyright (c) 2015 Alex Izotov. All rights reserved.
//

#import "AIZAppDelegate.h"
#import "AIZMainViewController.h"

@implementation AIZAppDelegate

- (BOOL)          application:(UIApplication *)application
didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc]
                   initWithFrame:[[UIScreen mainScreen] bounds]];

    self.viewController = [[AIZMainViewController alloc]
                           initWithNibName:nil
                           bundle:nil];
    self.window.rootViewController = self.viewController;

    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

@end
