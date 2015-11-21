//
//  AIZSingleComponentPickerViewController.m
//  Pickers
//
//  Created by X on 21/11/15.
//  Copyright (c) 2015 Alex Izotov. All rights reserved.
//

#import "AIZSingleComponentPickerViewController.h"

@interface AIZSingleComponentPickerViewController ()

@end

@implementation AIZSingleComponentPickerViewController

- (instancetype)init
{
    if (self = [super init])
    {
        self.title = @"Single";
        self.tabBarItem.image = [UIImage imageNamed:@"single"];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

@end
