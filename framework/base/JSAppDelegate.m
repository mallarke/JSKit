//
//  JSAppDelegate.m
//  JSKit
//
//  Created by mallarke on 9/19/13.
//  Copyright (c) 2013 shadow coding. All rights reserved.
//

#import "JSAppDelegate.h"

#import "UIView+XibLocalization.h"

#pragma mark - JSAppDelegate extension -

@interface JSAppDelegate()

@end

#pragma mark - JSAppDelegate implementation

@implementation JSAppDelegate

#pragma mark - Constructor/Destructor methods -

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [UIView swizzleText];
    
    CGRect bounds = [UIScreen mainScreen].bounds;

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

#pragma mark - Protected methods -

#pragma mark - Getter/Setter methods -

@end

