//
//  NSString+URL.h
//  JSKit
//
//  Created by mallarke on 9/20/13.
//  Copyright (c) 2013 shadow coding, inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (URL)

- (NSURL *)url;
- (NSURL *)encodedURL;

- (NSString *)urlEncode;

@end
