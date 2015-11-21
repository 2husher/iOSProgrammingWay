//
//  AIZDoubleComponentPickerViewController.m
//  Pickers
//
//  Created by X on 21/11/15.
//  Copyright (c) 2015 Alex Izotov. All rights reserved.
//

#import "AIZDoubleComponentPickerViewController.h"

@interface AIZDoubleComponentPickerViewController ()

@end

@implementation AIZDoubleComponentPickerViewController

- (instancetype)init
{
    if (self = [super init])
    {
        self.title = @"Double";
        self.tabBarItem.image = [UIImage imageNamed:@"double"];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

@end
