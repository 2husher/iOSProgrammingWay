//
//  AIZAppDelegate.m
//  TikiGoads
//
//  Created by X on 18/11/15.
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

    self.mainViewController = [[AIZMainViewController alloc]
                           initWithNibName: nil
                           bundle:nil];
    self.window.rootViewController = self.mainViewController;

    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

@end
