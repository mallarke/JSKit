//
//  JSView_Private.h
//  JSKit
//
//  Created by mallarke on 6/8/14.
//  Copyright (c) 2014 shadow coding. All rights reserved.
//

#import <JSKit/JSKit.h>

@interface JSView ()

- (void)_viewWillAppear:(BOOL)animated;
- (void)_viewDidAppear:(BOOL)animated;

- (void)_viewWillDisappear:(BOOL)animated;
- (void)_viewDidDisappear:(BOOL)animated;

@end
