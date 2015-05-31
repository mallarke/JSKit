//
//  JSOverrideMethodException.h
//  JSKit
//
//  Created by mallarke on 6/8/14.
//  Copyright (c) 2014 shadow coding. All rights reserved.
//

#import <Foundation/Foundation.h>

#pragma mark - JSOverrideMethodException interface -

@interface JSOverrideMethodException : JSException

+ (void)raise:(SEL)selector forObject:(NSObject *)object;

@end
