//
//  JSView.m
//  JSKit
//
//  Created by mallarke on 9/19/13.
//  Copyright (c) 2013 shadow coding. All rights reserved.
//

#import "JSView_Private.h"

#pragma mark - JSView extension -

@interface JSView()

- (void)updateChildren:(BOOL)animated action:(void (^)(JSView *))action;

@end

#pragma mark - JSView implementation

@implementation JSView

#pragma mark - Constructor/Destructor methods -

- (id)init
{
    self = [super init];

    if(self) 
	{
        self.backgroundColor = [UIColor clearColor];
    }

    return self;
}

#pragma mark - Public methods -

- (void)viewWillAppear:(BOOL)animated {}
- (void)viewDidAppear:(BOOL)animated {}

- (void)viewWillDisappear:(BOOL)animated {}
- (void)viewDidDisappear:(BOOL)animated {}

#pragma mark - Private methods -

- (void)updateChildren:(BOOL)animated action:(void (^)(JSView *))action {
	NSArray *subviews = self.subviews;
	
    for (__block JSView *view in subviews) {
        if (![view isKindOfClass:[JSView class]] || !action) {
            continue;
        }
        
        action(view);
    }
}

#pragma mark - Protected methods -

- (void)_viewWillAppear:(BOOL)animated {
    [self viewWillAppear:animated];
    [self updateChildren:animated action:^(JSView *view) {
        [view _viewWillAppear:animated];
    }];
}

- (void)_viewDidAppear:(BOOL)animated {
    [self viewDidAppear:animated];
    [self updateChildren:animated action:^(JSView *view) {
        [view _viewDidAppear:animated];
    }];
}

- (void)_viewWillDisappear:(BOOL)animated {
    [self viewWillDisappear:animated];
    [self updateChildren:animated action:^(JSView *view) {
        [view _viewWillDisappear:animated];
    }];
}

- (void)_viewDidDisappear:(BOOL)animated {
	NSArray *subviews = self.subviews;
	for (UIView *view in subviews) {
		if ([view isFirstResponder])
    		[view resignFirstResponder];
	}
	
    [self viewDidDisappear:animated];
    [self updateChildren:animated action:^(JSView *view) {
        [view _viewDidDisappear:animated];
    }];
}

#pragma mark - Getter/Setter methods -

@end
