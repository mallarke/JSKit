//
//  UIImage+CustomInit.h
//  JSKit
//
//  Created by mallarke on 9/20/13.
//  Copyright (c) 2013 shadow coding, inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (CustomInit)

+ (UIImage *)image:(NSString *)name;
+ (UIImage *)resizableImageNamed:(NSString *)name;

@end
