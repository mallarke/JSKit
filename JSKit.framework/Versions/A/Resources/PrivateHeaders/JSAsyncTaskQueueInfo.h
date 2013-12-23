//
//  JSAsyncTaskQueueInfo.h
//  JSKit
//
//  Created by mallarke on 9/20/13.
//  Copyright (c) 2013 shadow coding. All rights reserved.
//

#import <Foundation/Foundation.h>

#pragma mark - JSAsyncTaskQueueInfo interface -

@interface JSAsyncTaskQueueInfo : NSObject

@property (strong) NSString *key;
@property (strong) dispatch_queue_t queue;
@property (strong) dispatch_semaphore_t semaphore;

- (id)initWithKey:(NSString *)key numberOfThreads:(int)threadCount;

@end
