//
//  UIView+XibLocalization.m
//  JSKit
//
//  Created by mallarke on 12/22/13.
//  Copyright (c) 2013 shadow coding. All rights reserved.
//

#import "UIView+XibLocalization.h"

@interface UIView (XibLocalizationCustomMethods)

- (id)initWithSwizzleCoder:(NSCoder *)coder;
- (void)updateText:(UIView *)view;

- (NSString *)parseString:(NSString *)string;

@end

@implementation UIView (XibLocalization)

+ (void)swizzleText
{
    js_swizzle_instance_method([self class], @selector(initWithCoder:), @selector(initWithSwizzleCoder:));
}

@end

@implementation UIView (XibLocalizationCustomMethods)

- (id)initWithSwizzleCoder:(NSCoder *)coder
{
    self = [self initWithSwizzleCoder:coder];
    
    if(self)
    {
        [self updateText:self];
    }
    
    return self;
}

- (void)updateText:(UIView *)view
{
    id v = view;

    if([view respondsToSelector:@selector(text)])
    {
        [v setText:[self parseString:[v text]]];
    }
    
    if([view respondsToSelector:@selector(placeholder)])
    {
        [v setPlaceholder:[self parseString:[v placeholder]]];
    }
    
    if([view respondsToSelector:@selector(titleForState:)])
    {
        [v setTitle:[self parseString:[v titleForState:UIControlStateNormal]] forState:UIControlStateNormal];
        [v setTitle:[self parseString:[v titleForState:UIControlStateHighlighted]] forState:UIControlStateHighlighted];
        [v setTitle:[self parseString:[v titleForState:UIControlStateApplication]] forState:UIControlStateApplication];
        [v setTitle:[self parseString:[v titleForState:UIControlStateDisabled]] forState:UIControlStateDisabled];
        [v setTitle:[self parseString:[v titleForState:UIControlStateReserved]] forState:UIControlStateReserved];
        [v setTitle:[self parseString:[v titleForState:UIControlStateSelected]] forState:UIControlStateSelected];
    }
    
    for(UIView *subView in view.subviews)
    {
        [self updateText:subView];
    }
}

- (NSString *)parseString:(NSString *)string
{
    if([string contains:@"@string/"])
    {
        NSArray *components = [string componentsSeparatedByString:@"@string/"];
        NSString *selectorName = components[1];
        
        SEL selector = NSSelectorFromString(selectorName);
        
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
        @try
        {
            Class class = NSClassFromString(@"LocalizedString");
            string = [class performSelector:selector];
        }
        @catch (NSException *e)
        {
            NSString *reason = [NSString stringWithFormat:@"There was no valid mapping for %@ in your strings.h", selectorName];
            @throw [[JSException alloc] initWithName:@"Missing resource" reason:reason userInfo:nil];
        }
#pragma clang diagnostic pop
    }
    
    return string;
}

@end
