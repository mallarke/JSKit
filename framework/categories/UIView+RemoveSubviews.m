//
//  UIView+CustomInit.m
//  JSKit
//
//  Created by mallarke on 9/20/13.
//  Copyright (c) 2013 shadow coding, Inc. All rights reserved.
//

#import "UIView+RemoveSubviews.h"

@implementation UIView (RemoveSubviews)

- (void)removeAllSubviews
{
    for(UIView *subview in self.subviews)
    {
        [subview removeFromSuperview];
    }
}

@end
