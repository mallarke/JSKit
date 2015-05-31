//
//  JSImageManager.h
//  JSKit
//
//  Created by mallarke on 2/23/14.
//  Copyright (c) 2014 shadow coding. All rights reserved.
//

#import <Foundation/Foundation.h>

#pragma mark - JSImageManager interface -

@interface JSImageManager : NSObject

+ (JSImageManager *)sharedManager;

- (UIImage *)get:(NSString *)name;

@end
