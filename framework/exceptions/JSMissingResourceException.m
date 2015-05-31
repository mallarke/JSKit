//
//  JSMissingResourceException.m
//  JSKit
//
//  Created by mallarke on 6/8/14.
//  Copyright (c) 2014 shadow coding. All rights reserved.
//

#import "JSMissingResourceException.h"

#pragma mark - JSMissingResourceException extension -

@interface JSMissingResourceException()

+ (NSString *)name;

@end

#pragma mark - JSMissingResourceException implementation

@implementation JSMissingResourceException

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

#pragma mark - Private methods -

+ (NSString *)name {
    return @"Missing Resource exception";
}

#pragma mark - Protected methods -

#pragma mark - Getter/Setter methods -

@end

