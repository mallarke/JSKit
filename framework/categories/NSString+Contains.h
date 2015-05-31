//
//  NSString+Contains.h
//  JSKit
//
//  Created by mallarke on 2/17/14.
//  Copyright (c) 2014 shadow coding. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Contains)

- (BOOL)contains:(NSString *)substring;
- (BOOL)containsAny:(NSArray *)substrings;

@end
