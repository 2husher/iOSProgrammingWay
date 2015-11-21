//
//  AIZCustomPickerViewController.m
//  Pickers
//
//  Created by X on 21/11/15.
//  Copyright (c) 2015 Alex Izotov. All rights reserved.
//

#import "AIZCustomPickerViewController.h"

@interface AIZCustomPickerViewController ()

@end

@implementation AIZCustomPickerViewController

- (instancetype)init
{
    if (self = [super init])
    {
        self.title = @"Custom";
        self.tabBarItem.image = [UIImage imageNamed:@"custom"];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

@end
