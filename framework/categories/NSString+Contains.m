//
//  NSString+Contains.m
//  JSKit
//
//  Created by mallarke on 2/17/14.
//  Copyright (c) 2014 shadow coding. All rights reserved.
//

#import "NSString+Contains.h"

@implementation NSString (Contains)

- (BOOL)contains:(NSString *)substring
{
    if(![substring isKindOfClass:[NSString class]])
        return false;
    
    return ([self rangeOfString:substring].location != NSNotFound);
}

- (BOOL)containsAny:(NSArray *)substrings
{
    for(NSString *string in substrings)
    {
        if([self contains:string])
            return true;
    }
    
    return false;
}

@end
