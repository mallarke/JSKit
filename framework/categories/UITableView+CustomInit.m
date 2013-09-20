//
//  UITableView+CustomInit.m
//  JSKit
//
//  Created by mallarke on 9/20/13.
//  Copyright (c) 2013 shadow coding, Inc. All rights reserved.
//

#import "UITableView+CustomInit.h"

@implementation UITableView (CustomInit)

- (id)initTableView:(id<UITableViewDataSource>)datasource delegate:(id<UITableViewDelegate>)delegate
{
    self = [super init];
    
    if(self)
    {
        self.dataSource = datasource;
        self.delegate = delegate;
        self.separatorColor = [UIColor clearColor];
        self.backgroundColor = [UIColor clearColor];
    }
    
    return self;
}

@end
