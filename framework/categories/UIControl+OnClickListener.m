//
//  UIControl+OnClickListener.m
//  JSKit
//
//  Created by mallarke on 3/2/14.
//  Copyright (c) 2014 shadow coding. All rights reserved.
//

#import "UIControl+OnClickListener.h"

#import <objc/runtime.h>

static char const * const LIMIT_KEY = "onClickListenerLimitKey";
static char const * const LISTENER_KEY = "onClickListenerKey";

static BOOL DISABLED_BUTTON_CLICKS = false;

@implementation UIControl (OnClickListener)

- (void)onButtonClick:(UIControl *)control withEvent:(UIEvent *)event
{
    if(DISABLED_BUTTON_CLICKS)
        return;
    
    BOOL limit = [objc_getAssociatedObject(self, LIMIT_KEY) boolValue];
    
    if(limit)
    {
        UITouch *touch = event.allTouches.anyObject;
        if(touch.tapCount == 1 && self.onClickListener)
        {
            self.onClickListener();
        }
    }
    else
    {
        self.onClickListener();
    }
}

- (UIControlOnClickListener)onClickListener
{
    return objc_getAssociatedObject(self, LISTENER_KEY);
}

- (void)setOnClickListener:(UIControlOnClickListener)onClickListener
{
    [self setOnClickListener:true listener:onClickListener];
}

- (void)setOnClickListener:(BOOL)limit listener:(UIControlOnClickListener)onClickListener
{
    objc_setAssociatedObject(self, LIMIT_KEY, @(limit), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    objc_setAssociatedObject(self, LISTENER_KEY, onClickListener, OBJC_ASSOCIATION_COPY);
    [self addTarget:self action:@selector(onButtonClick:withEvent:) forControlEvents:UIControlEventTouchUpInside];
}

+ (void)disableButtonClicks:(BOOL)disable
{
    DISABLED_BUTTON_CLICKS = disable;
}

@end
