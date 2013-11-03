//
//  JSVersionFactory.m
//  JSKit
//
//  Created by mallarke on 9/20/13.
//  Copyright (c) 2013 shadow coding. All rights reserved.
//

#import "JSVersionFactory.h"

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

static id get_instance(NSString *name)
{
    Class className = NSClassFromString(name);
    if(className)
    {
        return [className new];
    }
    
    return nil;
}

#pragma mark - JSVersionFactory extension -

@interface JSVersionFactory()

+ (int)getVersion;

@end

#pragma mark - JSVersionFactory implementation

@implementation JSVersionFactory

#pragma mark - Constructor/Destructor methods -

- (id)init
{
    self = [super init];

    if(self) 
	{

    }

    return self;
}

- (void)dealloc
{
}

#pragma mark - Public methods -

+ (NSString *)getClassNameForName:(NSString *)originalClass
{
    NSAssert(originalClass != nil, @"[%@ %@]: class name can't be nil", NSStringFromClass([self class]), NSStringFromSelector(_cmd));
    
    UIUserInterfaceIdiom type = [UIDevice currentDevice].userInterfaceIdiom;
    NSString *device = get_device_name(type);
    int version = [self getVersion];
    
    NSString *name = [NSString stringWithFormat:@"%@_%d_%@", originalClass, version, device];
    if(NSClassFromString(name))
        return name;
    
    name = [NSString stringWithFormat:@"%@_%d", originalClass, version];
    if(NSClassFromString(name))
        return name;
    
    return originalClass;
}

+ (NSString *)getClassNameForClass:(__unsafe_unretained Class)className
{
    NSString *name = NSStringFromClass(className);
    return [self getClassNameForName:name];
}

+ (id)getInstanceFromName:(NSString *)className
{
    return get_instance([self getClassNameForName:className]);
}

+ (id)getInstanceFromClass:(__unsafe_unretained Class)className
{
    return get_instance([self getClassNameForClass:className]);
}

#pragma mark - Private methods -

+ (int)getVersion
{
    NSString *version = [[UIDevice currentDevice] systemVersion];
    NSArray *components = [version componentsSeparatedByString:@"."];
    
    return [[components objectAtIndex:0] intValue];
}

#pragma mark - Protected methods -

#pragma mark - Getter/Setter methods -

@end

