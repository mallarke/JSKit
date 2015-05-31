//
//  UIControl+OnClickListener.h
//  JSKit
//
//  Created by mallarke on 3/2/14.
//  Copyright (c) 2014 shadow coding. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^UIControlOnClickListener)();

@interface UIControl (OnClickListener)

@property (copy) UIControlOnClickListener onClickListener;

- (void)setOnClickListener:(BOOL)limit listener:(UIControlOnClickListener)onClickListener;

// this only works when using UIControlOnClickListener
+ (void)disableButtonClicks:(BOOL)disable;

@end
