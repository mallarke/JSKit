//
//  ViewController.m
//  JSKit
//
//  Created by mallarke on 9/19/13.
//  Copyright (c) 2013 shadow coding. All rights reserved.
//

#import "ViewController.h"
#import "AsyncTask.h"

#import "View.h"

#import "SubViewController.h"

#define FORMATTED_NSSTRING(format, ...) [NSString stringWithFormat:format, ##__VA_ARGS__]

#pragma mark - ViewController extension -

@interface ViewController()

@property (nonatomic, strong) View *view;
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
    __weak ViewController *wself = self;
    
    self.view = [View new];
    self.view.listener = ^ {
		[wself.navigationController pushViewController:[SubViewController new] animated:true];
    };
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    JSAsyncTaskResponseHandler handler = ^(id response)
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:self.alertText message:[LocalizedString puppy:@"Max", @"awesome", nil] delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil];
        [alert show];
    };
    
    AsyncTask *task = [AsyncTask new];
    task.handler = handler;
//    [task start];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
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