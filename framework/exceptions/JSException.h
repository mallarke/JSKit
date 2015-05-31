//
//  JSException.h
//  JSKit
//
//  Created by mallarke on 2/23/14.
//  Copyright (c) 2014 shadow coding. All rights reserved.
//

#import <Foundation/Foundation.h>

#pragma mark - JSException interface -

@interface JSException : NSException

+ (NSString *)name;
+ (void)raise:(NSString *)format, ... ;

@end

