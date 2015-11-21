//
//  AIZDependentComponentPickerViewController.m
//  Pickers
//
//  Created by X on 21/11/15.
//  Copyright (c) 2015 Alex Izotov. All rights reserved.
//

#import "AIZDependentComponentPickerViewController.h"

@interface AIZDependentComponentPickerViewController ()

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
}

@end
