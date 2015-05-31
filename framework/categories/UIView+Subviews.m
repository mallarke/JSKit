//
//  UIView+CustomInit.m
//  JSKit
//
//  Created by mallarke on 9/20/13.
//  Copyright (c) 2013 shadow coding, Inc. All rights reserved.
//

#import "UIView+Subviews.h"

@implementation UIView (Subviews)

- (void)addSubviews:(NSArray *)subviews
{
    for(UIView *view in subviews)
    {
        if(![view isMemberOfClass:[UIView class]])
            continue;
        
        [self addSubview:view];
    }
}

- (void)removeAllSubviews
{
    for(UIView *subview in self.subviews)
    {
        [subview removeFromSuperview];
    }
}

@end
