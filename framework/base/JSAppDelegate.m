//
//  JSAppDelegate.m
//  JSKit
//
//  Created by mallarke on 9/19/13.
//  Copyright (c) 2013 shadow coding. All rights reserved.
//

#import "JSAppDelegate.h"

#import "NSObject+Versioning.h"

#pragma mark - JSAppDelegate extension -

@interface JSAppDelegate()

- (void)setUpVersioning;

@end

#pragma mark - JSAppDelegate implementation

@implementation JSAppDelegate

#pragma mark - Constructor/Destructor methods -

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // set up our versioning stuffs
    [self setUpVersioning];
    
    CGFloat statusBarHeight = application.statusBarFrame.size.height;

    CGRect bounds = [UIScreen mainScreen].bounds;
    bounds.size.height -= statusBarHeight;
    
    self.window = [UIWindow new];
    self.window.frame = bounds;
    [self.window makeKeyAndVisible];
    
    return true;
}

- (void)dealloc
{
    self.window = nil;
}

#pragma mark - Public methods -

#pragma mark - Private methods -

- (void)setUpVersioning
{
    return;
    NSString *path = [[NSBundle mainBundle] pathForResource:@"VersionList" ofType:@"plist"];
    NSDictionary *versioningPlist = [NSDictionary dictionaryWithContentsOfFile:path];
    
    path = [[NSBundle mainBundle] resourcePath];
    path = [path stringByAppendingPathComponent:@"JSKit.framework"];
    path = [path stringByAppendingPathComponent:@"Resources"];
    path = [path stringByAppendingPathComponent:@"JSVersionList.plist"];
    NSDictionary *jsversioningPlist = [NSDictionary dictionaryWithContentsOfFile:path];
    
    if(!jsversioningPlist)
    {
        [NSException raise:@"Missing Resources Exception" format:@"Include JSKit.framework in the Copy Resources build phase."];
    }
    
    NSArray *keys = [versioningPlist allKeys];
    for(NSString *key in keys)
    {
        NSArray *methods = [versioningPlist objectForKey:key];
        for(NSString *method in methods)
        {
            NSString *version = [NSString stringWithFormat:@"%@_iOS7", method];
            SEL original = NSSelectorFromString(method);
            SEL replacement = NSSelectorFromString(version);
            
            Class c = NSClassFromString(key);
            if([c instancesRespondToSelector:replacement])
            {
//                js_swizzle_instance_method(c, original, replacement);
            }
        }
    }
}

#pragma mark - Protected methods -

#pragma mark - Getter/Setter methods -

@end

