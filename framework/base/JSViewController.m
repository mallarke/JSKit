//
//  JSViewController.m
//  JSKit
//
//  Created by mallarke on 9/19/13.
//  Copyright (c) 2013 shadow coding. All rights reserved.
//

#import "JSViewController.h"
#import "JSView.h"

#pragma mark - JSViewController extension -

@interface JSViewController()

@property (nonatomic, strong) JSView *view;

@end

#pragma mark - JSViewController implementation

@implementation JSViewController

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

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.view viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self.view viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [self.view viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    [self.view viewDidDisappear:animated];
}

#pragma mark - Public methods -

- (void)pushViewController:(JSViewController *)viewController animated:(BOOL)animated
{
    [self.navigationController pushViewController:viewController animated:animated];
}

- (void)pushViewController:(JSViewController *)viewController
{
    [self.navigationController pushViewController:viewController animated:true];
}

- (void)popViewController:(JSViewController *)viewController
{
    [self.navigationController popViewControllerAnimated:true];
}

- (void)popToRootViewController:(BOOL)animated
{
    [self.navigationController popViewControllerAnimated:animated];
}

- (void)popToRootViewController
{
    [self.navigationController popViewControllerAnimated:true];
}

#pragma mark - Private methods -

#pragma mark - Protected methods -

#pragma mark - Getter/Setter methods -

@end
