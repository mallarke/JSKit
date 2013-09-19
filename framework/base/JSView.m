//
//  JSView.m
//  JSKit
//
//  Created by mallarke on 9/19/13.
//  Copyright (c) 2013 shadow coding. All rights reserved.
//

#import "JSView.h"

#pragma mark - JSView extension -

@interface JSView()

@end

#pragma mark - JSView implementation

@implementation JSView

#pragma mark - Constructor/Destructor methods -

- (id)init
{
    self = [super init];

    if(self) 
	{
        self.backgroundColor = [UIColor whiteColor];
    }

    return self;
}

- (void)dealloc
{
}

#pragma mark - Public methods -

- (void)viewWillAppear:(BOOL)animated {}
- (void)viewDidAppear:(BOOL)animated {}

- (void)viewWillDisappear:(BOOL)animated {}
- (void)viewDidDisappear:(BOOL)animated {}

#pragma mark - Private methods -

#pragma mark - Protected methods -

#pragma mark - Getter/Setter methods -

@end
