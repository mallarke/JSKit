//
//  JSAsyncTaskQueueInfo.m
//  JSKit
//
//  Created by mallarke on 9/20/13.
//  Copyright (c) 2013 shadow coding. All rights reserved.
//

#import "JSAsyncTaskQueueInfo.h"

#pragma mark - JSAsyncTaskQueueInfo extension -

@interface JSAsyncTaskQueueInfo()

@end

#pragma mark - JSAsyncTaskQueueInfo implementation

@implementation JSAsyncTaskQueueInfo

#pragma mark - Constructor/Destructor methods -

- (id)init
{
    [NSException raise:@"Invalid method" format:@"Use - (void)initWithKey:isConcurrent: instead"];
    return nil;
}

- (id)initWithKey:(NSString *)key numberOfThreads:(int)threadCount
{
    self = [super init];
    
    if(self)
    {
        self.key = key;
        self.queue = dispatch_queue_create([key UTF8String], (threadCount > 1 ? DISPATCH_QUEUE_CONCURRENT : NULL));
        self.semaphore = dispatch_semaphore_create(threadCount);
    }
    
    return self;
}

- (void)dealloc
{
}

#pragma mark - Public methods -

#pragma mark - Private methods -

#pragma mark - Protected methods -

#pragma mark - Getter/Setter methods -

@end

