//
//  JSAsyncTask.h
//  JSKit
//
//  Created by mallarke on 9/20/13.
//  Copyright (c) 2013 shadow coding. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^JSAsyncTaskResponseHandler)(id);

#pragma mark - JSAsyncTask interface -

/**
 *
 * @Abstracted
 * Abstracted class that enables easy and safe threading.  This class is designed
 * for the user to sub class and override the following methods:
 *
 * - (NSString *)taskName</br>
 *
 * - (void)pretask</br>
 * - (void)backgroundTask</br>
 * - (void)postTask</br>
 */
@interface JSAsyncTask : NSObject

/**
 *
 * Name of the thread that is spawned.  The bundle id is already added so only set this 
 * to whatever is relevant to what the task is handling.
 *
 */
@property (readonly) NSString *taskName;

/**
 *
 * Max number of threads that you would like spawned.  The default value is 5.  Pass 1 for 
 * serial threading.
 */
@property (readonly) int maxNumberOfThreads;

/**
 * 
 * Oject that is returned in your handler.  This should be set from within your backgroundTask.
 *
 */
@property (strong) id response;

/**
 * Callback that is used when task finishes.  Returns the response property.
 *
 */
@property (copy) JSAsyncTaskResponseHandler handler;

/**
 *
 * Starts your task.
 *
 */
- (void)start;

/**
 * Cancels your task.  You will not receive any callback on your handler.
 *
 */
- (void)cancel;

// protected methods

/**
 *
 * Method that is called on whichever thread [JSAsyncTask start] is called from.  Allows pre task set up
 * for convenience.  Not required to override in child classes.
 *
 */
- (void)preTask;

/**
 *
 * Runs on a newly spawned thread. Anything run from within this method must be
 * synchronous. Required to override in child classes.
 *
 */
- (void)backgroundTask;

/**
 *
 * Ran on the main thread. Handler is already called for you.  Not required to override in child classes.
 *
 */
- (void)postTask;

@end
