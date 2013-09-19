//
//  JSAppDelegate.h
//  JSKit
//
//  Created by mallarke on 9/19/13.
//  Copyright (c) 2013 shadow coding. All rights reserved.
//

#import <UIKit/UIKit.h>

#pragma mark - JSAppDelegate interface -

@interface JSAppDelegate : UIResponder <UIApplicationDelegate>

@property (nonatomic, strong) UIWindow *window;

@property (readonly) BOOL usesNavigationController;

@property (readonly) __unsafe_unretained Class customNavBarClass;
@property (readonly) __unsafe_unretained Class customTabBarClass;

/*
 * should either be the view controller you would like to use for the navigation 
 * controller if you return true for usesNavigationController or for the window's 
 * root view controller.
 */
@property (readonly) UIViewController *rootViewController;

@end
