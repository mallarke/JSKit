//
//  ViewController.m
//  JSKit
//
//  Created by mallarke on 9/19/13.
//  Copyright (c) 2013 shadow coding. All rights reserved.
//

#import "ViewController.h"
#import "AsyncTask.h"

#pragma mark - ViewController extension -

@interface ViewController()

@property (readonly) NSString *alertText;

@end

#pragma mark - ViewController implementation

@implementation ViewController

#pragma mark - Constructor/Destructor methods -

- (id)init
{
    self = [super init];

    if(self) 
	{
        self.title = @"Sample App";
    }

    return self;
}

- (void)dealloc
{
}

#pragma mark - View life cycle methods -

- (void)loadView
{
    self.view = [JSView new];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    JSAsyncTaskResponseHandler handler = ^(id response)
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:self.alertText message:@"I'm a message" delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil];
        [alert show];
    };
    
    AsyncTask *task = [AsyncTask new];
    task.handler = handler;
    [task start];
}

#pragma mark - Public methods -

#pragma mark - Private methods -

#pragma mark - Protected methods -

#pragma mark - Getter/Setter methods -

- (NSString *)alertText
{
    return @"I'm some default text";
}

- (NSString *)alertText_iOS7
{
    return @"I'm running on iOS 7";
}

@end