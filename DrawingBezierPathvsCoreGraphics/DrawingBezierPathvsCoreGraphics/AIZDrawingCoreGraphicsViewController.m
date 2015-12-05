//
//  AIZDrawingCoreGraphicsViewController.m
//  DrawingBezierPathvsCoreGraphics
//
//  Created by X on 05/12/15.
//  Copyright (c) 2015 Alex Izotov. All rights reserved.
//

#import "AIZDrawingCoreGraphicsViewController.h"
#import "AIZCoreGraphicsView.h"

@interface AIZDrawingCoreGraphicsViewController ()

@end

@implementation AIZDrawingCoreGraphicsViewController

- (instancetype)init
{
    if (self = [super init])
    {
        self.title = @"Core Graphics";
        self.tabBarItem.image = [UIImage imageNamed:@"second"];
    }
    return self;
}

- (void)loadView
{
    AIZCoreGraphicsView *view =
        [[AIZCoreGraphicsView alloc]
         initWithFrame:[[UIScreen mainScreen] bounds]];
    view.backgroundColor = [UIColor grayColor];
    self.view = view;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

@end
