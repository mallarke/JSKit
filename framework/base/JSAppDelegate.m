//
//  JSAppDelegate.m
//  JSKit
//
//  Created by mallarke on 9/19/13.
//  Copyright (c) 2013 shadow coding. All rights reserved.
//

#import "JSAppDelegate.h"

#pragma mark - JSAppDelegate extension -

@interface JSAppDelegate()

@property (strong) UINavigationController *navController;
@property (strong) UIViewController *appRootViewController;

- (void)throwNilRootViewException;

@end

#pragma mark - JSAppDelegate implementation

@implementation JSAppDelegate

#pragma mark - Constructor/Destructor methods -

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{    
    UIViewController *root = nil;
    self.appRootViewController = self.rootViewController;
    
    if(!self.appRootViewController)
    {
        [self throwNilRootViewException];
    }
    
    if(self.usesNavigationController)
    {
        __unsafe_unretained Class navBarClass = self.customNavBarClass;
        __unsafe_unretained Class tabBarClass = self.customTabBarClass;
        
        if(navBarClass || tabBarClass)
            self.navController = [[UINavigationController alloc] initWithNavigationBarClass:navBarClass toolbarClass:tabBarClass];
        else
            self.navController = [UINavigationController new];

        [self.navController pushViewController:self.appRootViewController animated:false];
        
        root = self.navController;
    }
    else
    {
        root = self.appRootViewController;
    }
    
    CGFloat statusBarHeight = application.statusBarFrame.size.height;

    CGRect bounds = [UIScreen mainScreen].bounds;
    bounds.size.height -= statusBarHeight;
    
    self.window = [UIWindow new];
    self.window.frame = bounds;
    self.window.rootViewController = root;
    [self.window makeKeyAndVisible];
    
    return true;
}

- (void)dealloc
{
    self.window = nil;
    self.navController = nil;
    self.appRootViewController = nil;
}

#pragma mark - Public methods -

#pragma mark - Private methods -

- (void)throwNilRootViewException
{
    [NSException raise:@"Invalid root viewcontroller. override - (UIViewController *)rootViewController in your AppDelegate.m." format:@"rootViewController can not be nil"];
}

#pragma mark - Protected methods -

#pragma mark - Getter/Setter methods -

- (BOOL)usesNavigationController { return false; }

- (Class)customNavBarClass { return nil; }
- (Class)customTabBarClass { return nil; }

- (UIViewController *)rootViewController
{
    [self throwNilRootViewException];
    return nil;
}

@end

