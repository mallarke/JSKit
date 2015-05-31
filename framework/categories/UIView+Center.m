//
//  UIView+Center.m
//  JSKit
//
//  Created by mallarke on 9/20/13.
//  Copyright (c) 2013 bob, Inc. All rights reserved.
//

#import "UIView+Center.h"

@implementation UIView (Center)

- (void)centerView
{
    CGSize maxSize = self.superview.bounds.size;
    
    CGRect frame = self.frame;
    frame.origin.x = (maxSize.width - frame.size.width) / 2.0;
    frame.origin.y = (maxSize.height - frame.size.height) / 2.0;
    self.frame = frame;
}

- (void)centerHorizontal
{
    CGSize maxSize = self.superview.bounds.size;
    
    CGRect frame = self.frame;
    frame.origin.x = (maxSize.width - frame.size.width) / 2.0;
    self.frame = frame;
}

- (void)centerVertical
{
    CGSize maxSize = self.superview.bounds.size;
    
    CGRect frame = self.frame;
    frame.origin.y = (maxSize.height - frame.size.height) / 2.0;
    self.frame = frame;
}

- (void)centerVerticallyOn:(UIView *)view
{
    if(view.height > self.height)
    {
        self.y = view.y + ((view.height - self.height) / 2.0);
    }
    else
    {
        self.y = view.y - ((self.height - view.height) / 2.0);
    }
}

- (void)alignTop
{
    [self alignTop:0];
}

- (void)alignTop:(CGFloat)padding
{
    self.y = padding;
}

- (void)alignLeft
{
    [self alignLeft:0];
}

- (void)alignLeft:(CGFloat)padding
{
    self.x = padding;
}

- (void)alignRight
{
    [self alignRight:0];
}

- (void)alignRight:(CGFloat)padding
{
    self.x = self.superview.width - self.width - padding;
}

- (void)alignBottom
{
    [self alignBottom:0];
}

- (void)alignBottom:(CGFloat)padding
{
    self.y = self.superview.height - self.height - padding;
}

- (void)alignAbove:(UIView *)view
{
	[self alignAbove:view margin:0];
}

- (void)alignAbove:(UIView *)view margin:(CGFloat)margin
{
	self.y = view.y - (self.height + margin);
}

- (void)alignBelow:(UIView *)view
{
	[self alignBelow:view margin:0];
}

- (void)alignBelow:(UIView *)view margin:(CGFloat)margin
{
	self.y = view.y + view.height + margin;
}

- (void)alignToLeftOf:(UIView *)view
{
	[self alignToLeftOf:view margin:0];
}

- (void)alignToLeftOf:(UIView *)view margin:(CGFloat)margin
{
	self.x = view.x - (self.width + margin);
}

- (void)alignToRightOf:(UIView *)view
{
	[self alignToRightOf:view margin:0];
}

- (void)alignToRightOf:(UIView *)view margin:(CGFloat)margin
{
	self.x = view.x + view.width + margin;
}

@end
