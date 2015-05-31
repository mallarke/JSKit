//
//  View.h
//  JSKit
//
//  Created by mallarke on 2/17/14.
//  Copyright (c) 2014 shadow coding. All rights reserved.
//

#import <JSKit/JSKit.h>

typedef void (^ViewListener)();

#pragma mark - View interface -

@interface View : UIView

@property (copy) ViewListener listener;

@end
