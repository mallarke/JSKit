//
//  NSDictionary+BaseValues.h
//  JSKit
//
//  Created by mallarke on 9/20/13.
//  Copyright (c) 2013 shadow coding, inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (BaseValues)

- (BOOL)boolForKey:(NSString *)key;
- (int)intForKey:(NSString *)key;
- (float)floatForKey:(NSString *)key;
- (double)doubleForKey:(NSString *)key;

- (NSDate *)dateForKey:(NSString *)key;

@end
