//
//  JSViewController.h
//  JSKit
//
//  Created by mallarke on 9/19/13.
//  Copyright (c) 2013 shadow coding. All rights reserved.
//

#import <UIKit/UIKit.h>

#pragma mark - JSViewController interface -

@interface JSViewController : UIViewController

- (void)pushViewController:(JSViewController *)viewController animated:(BOOL)animated;
- (void)pushViewController:(JSViewController *)viewController;

- (void)popViewController:(JSViewController *)viewController;

- (void)popToRootViewController:(BOOL)animated;
- (void)popToRootViewController;

@end
