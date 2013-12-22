//
//  NSObject+Versioning.m
//  JSKit
//
//  Created by mallarke on 11/2/13.
//  Copyright (c) 2013 shadow coding. All rights reserved.
//

#import "NSObject+Versioning.h"

#import <objc/runtime.h>

static NSString *get_device_name(UIUserInterfaceIdiom type)
{
    switch(type)
    {
        case UIUserInterfaceIdiomPhone:
            return @"iphone";
            
        case UIUserInterfaceIdiomPad:
            return @"ipad";
    }
}

id get_class(Class name)
{
    return get_class_for_name(NSStringFromClass(name));
}

Class get_class_for_name(NSString *originalClass)
{
    UIUserInterfaceIdiom type = [UIDevice currentDevice].userInterfaceIdiom;
    NSString *device = get_device_name(type);
    int version = get_os_version();
    
    Class c = NSClassFromString([NSString stringWithFormat:@"%@_iOS%d_%@", originalClass, version, device]);
    if(c)
        return c;
    
    c = NSClassFromString([NSString stringWithFormat:@"%@_iOS%d", originalClass, version]);
    if(c)
        return c;
    
    return NSClassFromString(originalClass);
}

@interface NSObject (CustomMethod)

+ (id)swizzle_alloc;

@end

@implementation NSObject (Versioning)

+ (void)configure
{
    js_swizzle_class_method(self, @selector(class), @selector(swizzle_alloc));
}

@end

@implementation NSObject (CustomMethod)

+ (id)swizzle_alloc
{
//    const char *name = class_getName(self);
    
    return [self swizzle_alloc];
    
//    const char *name = [NSStringFromClass([self class]) UTF8String];
//    
//    if(strlen(name) >= 2 && ((name[0] == SAFE_NS[0] && name[1] == SAFE_NS[1]) || (name[0] == SAFE_UI[0] && name[1] == SAFE_UI[1])))
//    {
//        return [self swizzle_alloc];
//    }
//    
//    return [get_class([self class]) alloc];
}

@end