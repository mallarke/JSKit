//
//  NSString+URL.m
//  JSKit
//
//  Created by mallarke on 9/20/13.
//  Copyright (c) 2013 shadow coding, inc. All rights reserved.
//

#import "NSString+URL.h"

@implementation NSString(URL)

- (NSURL *)url
{
    return [NSURL URLWithString:self];
}

- (NSURL *)encodedURL
{
    return [[self urlEncode] url];
}

- (NSString *)urlEncode
{
    return [self stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
}

@end
