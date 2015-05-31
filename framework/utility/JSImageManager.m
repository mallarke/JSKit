//
//  JSImageManager.m
//  JSKit
//
//  Created by mallarke on 2/23/14.
//  Copyright (c) 2014 shadow coding. All rights reserved.
//

#import "JSImageManager.h"

struct ScreenSizesStruct
{
    __unsafe_unretained NSString *name;
    CGFloat width;
    CGFloat height;
    __unsafe_unretained NSString *imageSuffix;
};

typedef struct ScreenSizesStruct ScreenSizes;
static ScreenSizes screenSizes[] =
{
    { @"iPhone 4", 320, 480, @"" },
    { @"iPhone 5", 320, 568, @"-568h" },
	{ @"iPhone 6", 375, 667, @"-1334h" },
	{ @"iPhone 6+", 414, 736, @"@3x" }
};

static int supportedSizes = 4;
static ScreenSizes currentSize = { @"", 0, 0, @"" };

#pragma mark - ImageContainer interface -

@interface ImageContainer : NSObject

@property (nonatomic, strong) NSString *name;

@property (assign) CGFloat scale;
@property (assign) BOOL isFullScreen;

@property (strong) UIImage *portrait;
@property (strong) UIImage *landscape;

- (UIImage *)get;

@end

#pragma mark - ImageContainer implementation

@implementation ImageContainer

- (id)init
{
    self = [super init];
    
    if(self)
    {
        UIScreen *screen = [UIScreen mainScreen];
        if([screen respondsToSelector:@selector(scale)])
            self.scale = screen.scale;
        else
            self.scale = 1;
    }
    
    return self;
}

- (UIImage *)get
{
    UIInterfaceOrientation orientation = [UIApplication sharedApplication].statusBarOrientation;
    
    BOOL isLandscape = UIInterfaceOrientationIsLandscape(orientation);
    UIImage *image = (isLandscape ? self.landscape : self.portrait);

    if(!image)
    {
        NSLog(@"JSKit: missing image resource for: %@%@%@.png", self.name, (self.scale > 1 ? @"@2x" : @""), (isLandscape ? @"-landscape" : @""));
    }
    
    return image;
}

- (void)setName:(NSString *)name
{
    _name = name;

    NSString *fullSize = [name stringByAppendingString:currentSize.imageSuffix];
    UIImage *image = [UIImage imageNamed:fullSize];
    
    if(image)
    {
        self.portrait = image;
        name = fullSize;
    }
    else
    {
        self.portrait = [UIImage imageNamed:name];
    }
    
    CGSize size = self.portrait.size;
    if(size.width == currentSize.width || size.height == currentSize.height)
    {
        self.isFullScreen = true;
        name = [name stringByAppendingString:@"-landscape"];
        self.landscape = [UIImage imageNamed:name];
    }
    else
    {
        self.landscape = self.portrait;
    }
}

@end

#pragma mark - JSImageManager extension -

@interface JSImageManager()

@property (strong) NSMutableDictionary *map;

- (JSImageManager *)initForSingleton;

@end

#pragma mark - JSImageManager implementation

@implementation JSImageManager

#pragma mark - Constructor/Destructor methods -

- (id)init
{
    NSString *reason = @"Use the sharedManager of the singleton";
    @throw [[JSException alloc] initWithName:@"IllegalState exception" reason:reason userInfo:nil];
}

+ (JSImageManager *)sharedManager
{
    static JSImageManager *_singleton = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        _singleton = [[JSImageManager alloc] initForSingleton];
    });
    
    return _singleton;
}

- (JSImageManager *)initForSingleton
{
    self = [super init];
    
    if(self)
	{
        self.map = [NSMutableDictionary new];
    }
    
    return self;
}

- (void)dealloc
{
}

#pragma mark - Public methods -

- (UIImage *)get:(NSString *)name
{
    if(!name)
        return nil;
    
    ImageContainer *container = self.map[name];
    if(container)
    {
        return [container get];
    }
    
    if(currentSize.height == 0)
    {
        CGSize size = [UIScreen mainScreen].bounds.size;
        for(int i = 0; i < supportedSizes; i++)
        {
            ScreenSizes screenSize = screenSizes[i];
            if(screenSize.width == size.width && screenSize.height == size.height)
            {
                currentSize = screenSize;
                break;
            }
        }
    }
    
    if(currentSize.height == 0)
    {
        // unsupported device size
        return nil;
    }
    
    container = [ImageContainer new];
    container.name = name;
    
    self.map[name] = container;
    
    return [container get];
}

#pragma mark - Private methods -

#pragma mark - Protected methods -

#pragma mark - Getter/Setter methods -

@end

