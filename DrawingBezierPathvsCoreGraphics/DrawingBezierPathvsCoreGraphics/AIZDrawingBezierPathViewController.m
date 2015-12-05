//
//  AIZDrawingBezierPathViewController.m
//  DrawingBezierPathvsCoreGraphics
//
//  Created by X on 05/12/15.
//  Copyright (c) 2015 Alex Izotov. All rights reserved.
//

#import "AIZDrawingBezierPathViewController.h"

@interface AIZDrawingBezierPathViewController ()

@end

@implementation AIZDrawingBezierPathViewController

- (instancetype)init
{
    if (self = [super init])
    {
        self.title = @"Bezier Path";
        self.tabBarItem.image = [UIImage imageNamed:@"first"];
    }
    return self;
}

- (void)loadView
{
    UIView *view =  [[UIView alloc]
                     initWithFrame:[[UIScreen mainScreen] bounds]];
    view.backgroundColor = [UIColor orangeColor];
    self.view = view;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

@end
