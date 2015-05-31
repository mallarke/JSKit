//
//  SubView.m
//  JSKit
//
//  Created by mallarke on 7/9/14.
//  Copyright (c) 2014 shadow coding. All rights reserved.
//

#import "SubView.h"

#pragma mark - SubView extension -

@interface SubView() <UITextFieldDelegate>

@property (strong) UITextField *textField;

@end

#pragma mark - SubView implementation

@implementation SubView

#pragma mark - Constructor/Destructor methods -

- (id)init
{
    self = [super init];

    if(self) 
	{
        self.backgroundColor = [UIColor whiteColor];
        
        self.textField = [UITextField new];
        self.textField.delegate = self;
        self.textField.placeholder = @"Bob";
        self.textField.borderStyle = UITextBorderStyleRoundedRect;
        [self addSubview:self.textField];
    }

    return self;
}

#pragma mark - Public methods -

#pragma mark - Private methods -

#pragma mark - Protected methods -

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    [self.textField becomeFirstResponder];
}

- (void)layoutSubviews
{
	[super layoutSubviews];

	CGRect bounds = self.bounds;
	CGSize maxSize = bounds.size;
    
    static CGFloat kDefaultMargin = 20;
    
    [self.textField sizeToFit];
    self.textField.y = 90;
    self.textField.width = maxSize.width - (kDefaultMargin * 2);
    [self.textField centerHorizontal];
}

#pragma mark - Getter/Setter methods -

@end
