//
//  JSAsyncTask_Private.h
//  JSKit
//
//  Created by mallarke on 9/20/13.
//  Copyright (c) 2013 shadow coding. All rights reserved.
//

#import "JSAsyncTask.h"
#import "JSAsyncTaskQueueInfo.h"

@interface JSAsyncTask()

@property (strong) JSAsyncTaskQueueInfo *queueInfo;
@property (assign) BOOL hasBegun;
@property (assign) BOOL isFinished;

- (void)beginTask;

@end
