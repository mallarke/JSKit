//
//  JSView.m
//  JSKit
//
//  Created by mallarke on 9/19/13.
//  Copyright (c) 2013 shadow coding. All rights reserved.
//

#import "JSView.h"

CG_INLINE void _log(NSString *format, ...)
{
    va_list args;
    va_start(args, format);
    
    NSString *string = [[NSString alloc] initWithFormat:format arguments:args];
    
    va_end(args);
    
    NSLog(@"%@", string);
};

#define Log(__format__, ...) _log(__format__, ##__VA_ARGS__)

#pragma mark - JSView extension -

@interface JSView()

@end

#pragma mark - JSView implementation

@implementation JSView

#pragma mark - Constructor/Destructor methods -

- (id)init
{
    self = [super init];

    if(self) 
	{
        self.backgroundColor = [UIColor whiteColor];
    }

    return self;
}

- (void)dealloc
{
}

#pragma mark - Public methods -

- (void)viewWillAppear:(BOOL)animated {}
- (void)viewDidAppear:(BOOL)animated {}

- (void)viewWillDisappear:(BOOL)animated {}
- (void)viewDidDisappear:(BOOL)animated {}

#pragma mark - Private methods -

#pragma mark - Protected methods -

#pragma mark - Getter/Setter methods -

@end
