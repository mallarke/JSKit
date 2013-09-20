//
//  JSAsyncTaskManager.h
//  JSKit
//
//  Created by mallarke on 9/20/13.
//  Copyright (c) 2013 shadow coding. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "JSAsyncTaskQueueInfo.h"
#import "JSAsyncTask.h"

#pragma mark - JSAsyncTaskManager interface -

@interface JSAsyncTaskManager : NSObject

+ (JSAsyncTaskManager *)sharedManager;

- (void)addTask:(JSAsyncTask *)task;
- (void)removeTask:(JSAsyncTask *)task;

@end
