//
//  NSMutableDictionary+BaseValues.m
//  JSKit
//
//  Created by mallarke on 9/20/13.
//  Copyright (c) 2013 shadow coding, inc. All rights reserved.
//

#import "NSMutableDictionary+BaseValues.h"

@implementation NSMutableDictionary (BaseValues)

- (void)setBool:(BOOL)value forKey:(NSString *)key
{
    [self setValue:[NSNumber numberWithBool:value] forKey:key];
}

- (void)setInt:(int)value forKey:(NSString *)key
{
    [self setValue:[NSNumber numberWithInt:value] forKey:key];
}

- (void)setFloat:(float)value forKey:(NSString *)key
{
    [self setValue:[NSNumber numberWithFloat:value] forKey:key];
}

- (void)setDouble:(double)value forKey:(NSString *)key
{
    [self setValue:[NSNumber numberWithDouble:value] forKey:key];
}

- (void)setDate:(NSDate *)date forKey:(NSString *)key
{
    [self setDouble:date.timeIntervalSince1970 forKey:key];
}

@end
