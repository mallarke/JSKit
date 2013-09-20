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

- (void)alignLeft
{
    self.x = 0;
}

- (void)alignRight
{
    self.x = self.superview.width - self.width;
}

@end
