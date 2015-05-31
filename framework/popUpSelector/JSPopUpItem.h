//
//  JSPopUpItem.h
//  JSKit
//
//  Created by mallarke on 2/17/14.
//  Copyright (c) 2014 shadow coding. All rights reserved.
//

#import <JSKit/JSKit.h>

struct JSPopUpItemDataStruct
{
    __unsafe_unretained NSString *title;
    __unsafe_unretained UIImage *image;
};

typedef struct JSPopUpItemDataStruct JSPopUpItemData;

#pragma mark - JSPopUpItem interface -

@interface JSPopUpItem : UIView

- (id)initWithData:(JSPopUpItemData)data;

@property (strong, readonly) NSString *title;
@property (strong, readonly) UIImage *image;

@end
