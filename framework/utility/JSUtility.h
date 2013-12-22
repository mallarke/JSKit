//
//  JSUtility.h
//  JSKit
//
//  Created by mallarke on 11/2/13.
//  Copyright (c) 2013 shadow coding. All rights reserved.
//

#import <Foundation/Foundation.h>

#pragma mark - JSUtility methods -

int get_os_version();
BOOL is_ipad();

#pragma mark - Swizzle methods -

void js_swizzle_class_method(Class c, SEL originalSelector, SEL replacementSelector);
void js_swizzle_instance_method(Class c, SEL originalSelector, SEL replacementSelector);

#pragma mark - Versioning methods -

Class get_class(Class name);
Class get_class_for_name(NSString *originalClass);
