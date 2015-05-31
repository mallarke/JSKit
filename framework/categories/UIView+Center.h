//
//  UIView+Center.h
//  JSKit
//
//  Created by mallarke on 9/20/13.
//  Copyright (c) 2013 bob, Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Center)

- (void)centerView;
- (void)centerHorizontal;
- (void)centerVertical;

- (void)centerVerticallyOn:(UIView *)view;

- (void)alignTop;
- (void)alignTop:(CGFloat)padding;

- (void)alignLeft;
- (void)alignLeft:(CGFloat)padding;

- (void)alignRight;
- (void)alignRight:(CGFloat)padding;

- (void)alignBottom;
- (void)alignBottom:(CGFloat)padding;

- (void)alignAbove:(UIView *)view;
- (void)alignAbove:(UIView *)view margin:(CGFloat)margin;

- (void)alignBelow:(UIView *)view;
- (void)alignBelow:(UIView *)view margin:(CGFloat)margin;

- (void)alignToLeftOf:(UIView *)view;
- (void)alignToLeftOf:(UIView *)view margin:(CGFloat)margin;

- (void)alignToRightOf:(UIView *)view;
- (void)alignToRightOf:(UIView *)view margin:(CGFloat)margin;

@end
