//
//  JSPopUpSelector.m
//  JSKit
//
//  Created by mallarke on 2/17/14.
//  Copyright (c) 2014 shadow coding. All rights reserved.
//

#import "JSPopUpSelector.h"

typedef NS_ENUM(NSInteger, ViewState)
{
    ViewState_NONE, ViewState_ANIMATING, ViewState_OPEN, ViewState_CLOSED
};

#pragma mark - JSPopUpSelector extension -

@interface JSPopUpSelector()

@property (strong) UIButton *button;
@property (nonatomic, weak) JSPopUpItem *currentItem;

@property (assign) ViewState viewState;

- (void)onButtonPress:(UIButton *)button withEvent:(UIEvent *)event;

- (void)animateOpen;
- (void)animateClosed;

@end

#pragma mark - JSPopUpSelector implementation

@implementation JSPopUpSelector

#pragma mark - Constructor/Destructor methods -

- (id)init
{
    self = [super init];

    if(self) 
	{
        self.viewState = ViewState_NONE;
        
        self.button = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.button addTarget:self action:@selector(onButtonPress:withEvent:) forControlEvents:UIControlEventTouchDown];
        [self addSubview:self.button];
    }

    return self;
}

- (void)dealloc
{
}

#pragma mark - Public methods -

#pragma mark - Private methods -

- (void)onButtonPress:(UIButton *)button withEvent:(UIEvent *)event
{
    UITouch *touch = [event.allTouches anyObject];
    if(touch.tapCount == 1)
        [self animateOpen];
}

- (void)animateOpen
{
    
}

- (void)animateClosed
{
    
}

#pragma mark - Protected methods -

- (void)layoutSubviews
{
	[super layoutSubviews];
    
    if(self.viewState != ViewState_NONE)
        return;

	CGRect bounds = self.bounds;
	CGSize maxSize = bounds.size;

    CGFloat x = maxSize.width - self.button.width;
    CGFloat y = (maxSize.height - self.button.height) / 2.0;
    CGPoint location = CGPointMake(x, y);

    for(UIView *view in self.subviews)
    {
        view.origin = location;
    }
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    CGPoint location = [touches.anyObject locationInView:self];
    
    for(JSPopUpItem *item in self.items)
    {
        CGPoint locationInView = [item convertPoint:location fromView:self];
        if([item pointInside:locationInView withEvent:event])
        {
            self.currentItem = item;
            break;
        }
    }
    
    [self animateClosed];
}

#pragma mark - Getter/Setter methods -

- (void)setItems:(NSArray *)items
{
    _items = items;

    [self removeAllSubviews];
    [self addSubviews:items];
    
    if(items.count > 0)
        self.currentItem = items[0];
    
    [self bringSubviewToFront:self.button];
}

- (void)setCurrentItem:(JSPopUpItem *)currentItem
{
    if(_currentItem == currentItem)
        return;
    
    [self.button setImage:_currentItem.image forState:UIControlStateNormal];
    self.button.size = currentItem.size;
}

@end
