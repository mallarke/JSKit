//
//  ViewController.m
//  JSKit
//
//  Created by mallarke on 9/19/13.
//  Copyright (c) 2013 shadow coding. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (id)init
{
    self = [super init];
    
    if(self)
    {
        self.title = @"Sample App";
    }
    
    return self;
}

- (void)loadView
{
    self.view = [JSView new];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
