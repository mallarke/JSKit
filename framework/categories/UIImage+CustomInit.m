//
//  UIImage+CustomInit.m
//  JSKit
//
//  Created by mallarke on 9/20/13.
//  Copyright (c) 2013 shadow coding, inc. All rights reserved.
//

#import "UIImage+CustomInit.h"

@implementation UIImage (CustomInit)

+ (UIImage *)image:(NSString *)name
{
    return [self imageNamed:name];
}

+ (UIImage *)resizableImageNamed:(NSString *)name
{
    UIImage *image = [UIImage imageNamed:name];
    
    CGSize size = image.size;
    CGFloat horizontal = size.width / 2.0;
    CGFloat vertical = size.height / 2.0;
    
    return [image resizableImageWithCapInsets:UIEdgeInsetsMake(vertical, horizontal, vertical, horizontal)];
}

@end
