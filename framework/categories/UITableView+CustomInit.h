//
//  UITableView+CustomInit.h
//  JSKit
//
//  Created by mallarke on 9/20/13.
//  Copyright (c) 2013 shadow coding, Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableView (CustomInit)

- (id)initTableView:(id<UITableViewDataSource>)datasource delegate:(id<UITableViewDelegate>)delegate;

@end
