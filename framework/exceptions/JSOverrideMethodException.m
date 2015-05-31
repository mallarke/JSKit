//
//  JSOverrideMethodException.m
//  JSKit
//
//  Created by mallarke on 6/8/14.
//  Copyright (c) 2014 shadow coding. All rights reserved.
//

#import "JSOverrideMethodException.h"

#pragma mark - JSOverrideMethodException extension -

@interface JSOverrideMethodException()

@end

#pragma mark - JSOverrideMethodException implementation

@implementation JSOverrideMethodException

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

+ (void)raise:(SEL)selector forObject:(NSObject *)object {
    NSString *method = NSStringFromSelector(selector);
    NSString *class = NSStringFromClass([object class]);
    
    [NSException raise:[self name] format:@"%@ not overridden in %@", method, class];
}

+ (NSString *)name {
    return @"Override method exception";
}

#pragma mark - Private methods -

#pragma mark - Protected methods -

#pragma mark - Getter/Setter methods -

@end

