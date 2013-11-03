//
//  JSVersionFactory.h
//  JSKit
//
//  Created by mallarke on 9/20/13.
//  Copyright (c) 2013 shadow coding. All rights reserved.
//

#import <Foundation/Foundation.h>

#define OVERRIDE_ASSERT NSAssert(false, @"[%@ %@] must be over written in inherited class", NSStringFromClass([self class]), NSStringFromSelector(_cmd)); return nil;

#pragma mark - JSVersionFactory interface -

@interface JSVersionFactory : NSObject

+ (NSString *)getClassNameForName:(NSString *)className;
+ (NSString *)getClassNameForClass:(__unsafe_unretained Class)className;

+ (id)getInstanceFromName:(NSString *)className;
+ (id)getInstanceFromClass:(__unsafe_unretained Class)className;

@end
