//
//  NSString+JSKitStringMethods.m
//  JSKit
//
//  Created by mallarke on 12/22/13.
//  Copyright (c) 2013 shadow coding. All rights reserved.
//

#import "NSString+JSKitStringMethods.h"

@implementation NSString (JSKitStringMethods)

- (BOOL)contains:(NSString *)string
{
    return [self rangeOfString:string].location != NSNotFound;
}

@end
