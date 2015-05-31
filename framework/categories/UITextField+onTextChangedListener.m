//
//  UITextField+onTextChangedListener.m
//  JSKit
//
//  Created by mallarke on 3/2/14.
//  Copyright (c) 2014 shadow coding. All rights reserved.
//

#import "UITextField+onTextChangedListener.h"

#import <objc/runtime.h>

static char const * const LISTENER_KEY = "onTextDidChangeListenerKey";

@implementation UITextField (onTextChangedListener)

- (id)init
{
    self = [super init];
    
    if(self)
    {
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textChanged:) name:UITextFieldTextDidChangeNotification object:self];
    }
    
    return self;
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark - Private methods -

- (void)textChanged:(NSNotification *)notification
{
    if(notification.object == self && self.textDidChangeListener)
        self.textDidChangeListener(self.text);
}

#pragma mark - Getter/Setter methods

- (void)setTextDidChangeListener:(UITextFieldDidChangeListener)textDidChangeListener
{
    objc_setAssociatedObject(self, LISTENER_KEY, textDidChangeListener, OBJC_ASSOCIATION_COPY);
}

- (UITextFieldDidChangeListener)textDidChangeListener
{
    return objc_getAssociatedObject(self, LISTENER_KEY);
}

@end
