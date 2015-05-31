//
//  JSException.m
//  JSKit
//
//  Created by mallarke on 2/23/14.
//  Copyright (c) 2014 shadow coding. All rights reserved.
//

#import "JSException.h"

#pragma mark - JSException extension -

@interface JSException()

@end

#pragma mark - JSException implementation

@implementation JSException

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

+ (void)raise:(NSString *)format, ...  {
    va_list arguments;
    va_start(arguments, format);
    
    [NSException raise:[self name] format:format arguments:arguments];
    
    va_end(arguments);
}

+ (NSString *)name {
    return @"exception";
}

#pragma mark - Private methods -

#pragma mark - Protected methods -

#pragma mark - Getter/Setter methods -

@end

