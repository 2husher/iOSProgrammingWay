//
//  AIZDatePickerViewController.m
//  Pickers
//
//  Created by X on 21/11/15.
//  Copyright (c) 2015 Alex Izotov. All rights reserved.
//

#import "AIZDatePickerViewController.h"

@interface AIZDatePickerViewController ()

@end

@implementation AIZDatePickerViewController

- (instancetype)init
{
    if (self = [super init])
    {
        self.title = @"Date";
        self.tabBarItem.image = [UIImage imageNamed:@"date"];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

@end
