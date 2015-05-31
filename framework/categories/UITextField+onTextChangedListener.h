//
//  UITextField+TextChanged.h
//  JSKit
//
//  Created by mallarke on 3/2/14.
//  Copyright (c) 2014 shadow coding. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^UITextFieldDidChangeListener)(NSString *);

@interface UITextField (TextChanged)

@property (nonatomic, copy) UITextFieldDidChangeListener textDidChangeListener;

@end
