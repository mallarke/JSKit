//
//  SubViewController.m
//  JSKit
//
//  Created by mallarke on 7/9/14.
//  Copyright (c) 2014 shadow coding. All rights reserved.
//

#import "SubViewController.h"

#import "SubView.h"

#pragma mark - SubViewController extension -

@interface SubViewController()

//@property (nonatomic, strong) SubView *view;
@property (weak) IBOutlet UITextField *textField;

@end

#pragma mark - SubViewController implementation

@implementation SubViewController

#pragma mark - Constructor/Destructor methods -

- (id)init
{
    self = [super init];

    if(self) 
	{

    }

    return self;
}

- (void)dealloc
{
}

#pragma mark - View life cycle methods -

//- (void)loadView
//{
//    self.view = [SubView new];
//}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
	
    [self.textField becomeFirstResponder];
}

#pragma mark - Public methods -

#pragma mark - Private methods -

#pragma mark - Protected methods -

#pragma mark - Getter/Setter methods -

@end
