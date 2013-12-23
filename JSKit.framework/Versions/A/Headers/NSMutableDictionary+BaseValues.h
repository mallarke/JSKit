//
//  NSMutableDictionary+BaseValues.h
//  JSKit
//
//  Created by mallarke on 9/20/13.
//  Copyright (c) 2013 shadow coding, inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableDictionary (BaseValues)

- (void)setBool:(BOOL)value forKey:(NSString *)key;
- (void)setInt:(int)value forKey:(NSString *)key;
- (void)setFloat:(float)value forKey:(NSString *)key;
- (void)setDouble:(double)value forKey:(NSString *)key;

- (void)setDate:(NSDate *)date forKey:(NSString *)key;

@end
