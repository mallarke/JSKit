//
//  JSPopUpItem.m
//  JSKit
//
//  Created by mallarke on 2/17/14.
//  Copyright (c) 2014 shadow coding. All rights reserved.
//

#import "JSPopUpItem.h"

#pragma mark - JSPopUpItem extension -

@interface JSPopUpItem()

@property (strong, readwrite) NSString *title;
@property (strong, readwrite) UIImage *image;

@end

#pragma mark - JSPopUpItem implementation

@implementation JSPopUpItem

#pragma mark - Constructor/Destructor methods -

- (id)initWithData:(JSPopUpItemData)data
{
    self = [super init];
    
    if(self)
    {
        self.title = data.title;
        self.image = data.image;
        
        self.layer.contents = (id)data.image.CGImage;
        self.size = data.image.size;
        
        self.hidden = true;
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
