//
//  JSAsyncTask.m
//  JSKit
//
//  Created by mallarke on 9/20/13.
//  Copyright (c) 2013 shadow coding. All rights reserved.
//

#import "JSAsyncTask_Private.h"
#import "JSAsyncTaskManager.h"

#define MAX_NUMBER_OF_THREADS 5

#pragma mark - JSAsyncTask extension -

@interface JSAsyncTask()

@property (readonly) JSAsyncTaskManager *manager;

- (void)performBackgroundTask;
- (void)performFinishTask;

@end

#pragma mark - JSAsyncTask implementation

@implementation JSAsyncTask

#pragma mark - Constructor/Destructor methods -

- (id)init
{
    self = [super init];

    if(self) 
	{

    }

    return self;
}

- (void)dealloc
{
}

#pragma mark - Public methods -

- (void)start
{
    [self.manager addTask:self];
}

- (void)cancel
{
    self.isFinished = true;
    self.handler = nil;
    
    [self.manager removeTask:self];
}

#pragma mark - Private methods -

- (void)beginTask
{
    if(self.hasBegun)
        return;
    
    self.hasBegun = true;
    [self performBackgroundTask];
}

- (void)performBackgroundTask
{
    __weak typeof(self) wSelf = self;
    
    dispatch_block_t block = ^
    {
        [wSelf backgroundTask];
        [wSelf performFinishTask];
    };
    
    dispatch_async(self.queueInfo.queue, block);
}

- (void)performFinishTask
{
    __weak typeof(self) wSelf = self;
    
    dispatch_block_t block = ^
    {
        [wSelf postTask];
        
        if(wSelf.handler)
        {
            wSelf.handler(wSelf.response);
        }
        
        wSelf.isFinished = true;
        [wSelf.manager removeTask:wSelf];
    };
    
    dispatch_async(dispatch_get_main_queue(), block);
}

#pragma mark - Protected methods -

- (void)preTask {}
- (void)backgroundTask {}
- (void)postTask {}

#pragma mark - Getter/Setter methods -

- (JSAsyncTaskManager *)manager
{
    return [JSAsyncTaskManager sharedManager];
}

- (NSString *)taskName
{
    return @"default";
}

- (int)maxNumberOfThreads
{
    return 5;
}

@end

