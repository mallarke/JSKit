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

BOOL is_text_valid(NSString *text);

void dispatch_main_async(dispatch_block_t block);

NSString *format_string(NSString *format, NSString *firstString, va_list list);

#pragma mark - Swizzle methods -

void js_swizzle_class_method(Class c, SEL originalSelector, SEL replacementSelector);
void js_swizzle_instance_method(Class c, SEL originalSelector, SEL replacementSelector);
