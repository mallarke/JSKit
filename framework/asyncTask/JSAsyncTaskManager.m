//
//  JSAsyncTaskManager.m
//  JSKit
//
//  Created by mallarke on 9/20/13.
//  Copyright (c) 2013 shadow coding. All rights reserved.
//

#import "JSAsyncTaskManager.h"

#import "JSAsyncTask_Private.h"

#pragma mark - JSAsyncTaskManager extension -

@interface JSAsyncTaskManager()

@property (strong) NSString *baseQueueName;

@property (strong) NSMutableArray *asyncTasks;
@property (strong) NSMutableArray *infoItems;

- (void)flushTasks;
- (JSAsyncTaskQueueInfo *)queueInfoForTask:(JSAsyncTask *)task;

@end

#pragma mark - JSAsyncTaskManager implementation

@implementation JSAsyncTaskManager

static JSAsyncTaskManager *_singleton = nil;

#pragma mark - Constructor/Destructor methods -

- (id)init
{
    self = [super init];

    if(self) 
	{
        self.baseQueueName = [NSString stringWithFormat:@"%@.%@", [[NSBundle mainBundle] bundleIdentifier], @"backgroundTask"];
        
        self.asyncTasks = [NSMutableArray new];
        self.infoItems = [NSMutableArray new];
    }

    return self;
}

+ (JSAsyncTaskManager *)sharedManager
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^
    {
        _singleton = [self new];
    });
    
    return _singleton;
}

- (void)dealloc
{
}

#pragma mark - Public methods -

- (void)addTask:(JSAsyncTask *)task
{
    if(!task)
        return;
    
    [self.asyncTasks insertObject:task atIndex:0];
    task.queueInfo = [self queueInfoForTask:task];
    
    [self flushTasks];
}

- (void)removeTask:(JSAsyncTask *)task
{
    if(!task)
        return;
    
    NSArray *tasks = [NSArray arrayWithArray:self.asyncTasks];
    for(JSAsyncTask *task in tasks)
    {
        if(task.isFinished)
        {
            [self.asyncTasks removeObject:task];
        }
    }
    
    [self flushTasks];
}

#pragma mark - Private methods -

- (void)flushTasks
{
    @synchronized(self)
    {
        for(JSAsyncTask *task in self.asyncTasks)
        {
            if(!task.hasBegun)
            {
                [task beginTask];
            }
        }
    }
}

- (JSAsyncTaskQueueInfo *)queueInfoForTask:(JSAsyncTask *)task
{
    NSString *key = [NSString stringWithFormat:@"%@.%@", self.baseQueueName, task.taskName];
    
    JSAsyncTaskQueueInfo *info = nil;
    for(JSAsyncTaskQueueInfo *i in self.infoItems)
    {
        if([i.key isEqualToString:key])
        {
            info = i;
            break;
        }
    }
    
    if(!info)
    {
        info = [[JSAsyncTaskQueueInfo alloc] initWithKey:key numberOfThreads:task.maxNumberOfThreads];
        [self.infoItems addObject:info];
    }
    
    return info;
}

#pragma mark - Protected methods -

#pragma mark - Getter/Setter methods -

@end

