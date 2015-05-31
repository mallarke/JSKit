//
//  View.m
//  JSKit
//
//  Created by mallarke on 2/17/14.
//  Copyright (c) 2014 shadow coding. All rights reserved.
//

#import "View.h"

#import <JSKit/JSPopUpSelector.h>
#import <JSKit/JSImageManager.h>

#pragma mark - View extension -

@interface View()

@property (strong) UIImageView *imageView;

@end

#pragma mark - View implementation

@implementation View

#pragma mark - Constructor/Destructor methods -

- (id)init
{
    self = [super init];

    if(self)
	{
        self.backgroundColor = [UIColor purpleColor];
		
        self.imageView = [UIImageView new];
//		self.imageView.image = [UIImage imageNamed:@"LaunchImage.png"];
        [self addSubview:self.imageView];
        
        UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [button setTitle:@"turtle" forState:UIControlStateNormal];
        button.onClickListener = ^{
            if (self.listener)
                self.listener();
        };
        [self addSubview:button];

        [button sizeToFit];
        button.x = 20;
        button.y = 190;
    }

    return self;
}

- (void)dealloc
{
}

#pragma mark - Public methods -

#pragma mark - Private methods -

#pragma mark - Protected methods -

- (void)layoutSubviews
{
	[super layoutSubviews];

	CGRect bounds = self.bounds;
	CGSize maxSize = bounds.size;
	
	self.imageView.image = [Image LaunchImage];
    self.imageView.size = maxSize;
}

#pragma mark - Getter/Setter methods -

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    return true;
}

@end
