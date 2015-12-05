//
//  AIZCoreGraphicsView.m
//  DrawingBezierPathvsCoreGraphics
//
//  Created by X on 05/12/15.
//  Copyright (c) 2015 Alex Izotov. All rights reserved.
//

#import "AIZCoreGraphicsView.h"

@implementation AIZCoreGraphicsView

- (void)drawRect:(CGRect)rect
{
    [self drawForest];
}

- (void)drawForest
{
    CGContextRef context = UIGraphicsGetCurrentContext();

    for (NSInteger i = 0; i < 20; i++)
    {
        NSInteger x = arc4random() % (NSInteger)self.frame.size.width;
        NSInteger y = arc4random() % (NSInteger)self.frame.size.height;

        CGRect myRect = CGRectZero;
        CGPoint origin = CGPointMake(x, y);
        CGSize size    = CGSizeMake(40, 20);
        myRect.origin = origin;
        myRect.size   = size;

        [self drawTree:myRect inContext:context];
    }
}

- (void)drawTree:(CGRect)rect
       inContext:(CGContextRef)context
{
    [self drawTriangle:rect inContext:context];

    rect.origin.y = rect.origin.y + rect.size.height;
    [self drawTriangle:rect inContext:context];

    rect.origin.y = rect.origin.y + rect.size.height;
    [self drawTriangle:rect inContext:context];

    rect.origin.x = rect.origin.x - rect.size.width / 6;
    rect.origin.y = rect.origin.y + rect.size.height;
    [self drawRectangle:rect inContext:context];

}

- (void)drawTriangle:(CGRect)rect
           inContext:(CGContextRef)context
{
    CGContextBeginPath(context);
    CGContextSetFillColorWithColor(context, [[UIColor greenColor] CGColor]);

    CGFloat x = rect.origin.x;
    CGFloat y = rect.origin.y;

    CGFloat a = rect.size.width / 2;
    CGFloat b = rect.size.height;

    CGContextMoveToPoint(context, x, y);
    CGContextAddLineToPoint(context, x + a, y + b);
    CGContextAddLineToPoint(context, x - a, y + b);

    CGContextClosePath(context);

    CGContextFillPath(context);
}

- (void)drawRectangle:(CGRect)rect
            inContext:(CGContextRef)context
{
    CGContextBeginPath(context);
    CGContextSetFillColorWithColor(context, [[UIColor brownColor] CGColor]);

    CGFloat x = rect.origin.x;
    CGFloat y = rect.origin.y;

    CGFloat a = rect.size.width / 3;
    CGFloat b = rect.size.height / 2;

    CGRect myRect = CGRectMake(x, y, a, b);

    CGContextMoveToPoint(context, x, y);
    CGContextAddRect(context, myRect);

    CGContextFillPath(context);
}

@end



















