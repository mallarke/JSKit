//
//  JSUtility.m
//  JSKit
//
//  Created by mallarke on 11/2/13.
//  Copyright (c) 2013 shadow coding. All rights reserved.
//

#import "JSUtility.h"

#import <objc/runtime.h>

#pragma mark  - JSUtility methods -

int get_os_version()
{
    NSString *versionString = [[UIDevice currentDevice] systemVersion];
    const char *string = [versionString UTF8String];
    
    int version = string[0] - '0';
    return version;
}

BOOL is_ipad()
{
    return (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad);
}

BOOL is_text_valid(NSString *text)
{
    if(![text isKindOfClass:[NSString class]])
        return false;
    
    return (text && text.length > 0);        
}

void dispatch_main_async(dispatch_block_t block)
{
    dispatch_async(dispatch_get_main_queue(), block);
}

#pragma mark - Swizzle methods -

void js_swizzle_class_method(Class c, SEL originalSelector, SEL replacementSelector)
{
    Method originalMethod = class_getClassMethod(c, originalSelector);
    Method replacementMethod = class_getClassMethod(c, replacementSelector);
    
    c = object_getClass((id)c);

    if (class_addMethod(c, originalSelector, method_getImplementation(replacementMethod), method_getTypeEncoding(replacementMethod)))
    {
        class_replaceMethod(c, replacementSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
    }
    else
    {
        method_exchangeImplementations(originalMethod, replacementMethod);
    }
}

void js_swizzle_instance_method(Class c, SEL originalSelector, SEL replacementSelector)
{
    Method originalMethod = class_getInstanceMethod(c, originalSelector);
    Method replacementMethod = class_getInstanceMethod(c, replacementSelector);
    
    if (class_addMethod(c, originalSelector, method_getImplementation(replacementMethod), method_getTypeEncoding(replacementMethod)))
    {
        class_replaceMethod(c, replacementSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
    }
    else
    {
        method_exchangeImplementations(originalMethod, replacementMethod);
    }
}

#pragma mark - Private methods -

NSString *format_string(NSString *format, NSString *firstString, va_list list) {
    NSString *arg = nil;
    
    NSMutableArray *components = [NSMutableArray new];
    [components addObject:firstString];
    
    while ((arg = va_arg(list, NSString *))) {
        [components addObject:arg];
    }
    
    NSRange range;
    
    for (int i = 0; i < components.count; i++) {
        range = [format rangeOfString:@"%@"];
        if (range.location == NSNotFound) {
            break;
        }
        
        NSString *s = components[i];
        format = [format stringByReplacingCharactersInRange:range withString:s];
    }
    
    return format;
}