/* AUTO-GENERATED FILE!!! MODIFICATIONS WILL BE OVERWRITTEN */

#import "LocalizedString.h"

#import <JSKit/JSUtility.h>

@implementation LocalizedString

+ (NSString *)bob {
	return NSLocalizedString(@"muahahaha", nil);
}

+ (NSString *)cat:(NSString *)string {
	NSString *text = [NSString stringWithFormat:@"%@ is a cat....nuff said", string];
	return NSLocalizedString(text, nil);
}

+ (NSString *)max {
	return NSLocalizedString(@"he's a cool fucking dog", nil);
}

+ (NSString *)molly {
	return NSLocalizedString(@"she's my little puppy", nil);
}

+ (NSString *)puppy:(NSString *)string, ... {
	va_list list;
	va_start(list, string);
	NSString *text = format_string(@"%@ is an %@ puppy", string, list);
	va_end(list);

	return NSLocalizedString(text, nil);
}

+ (NSString *)skippy {
	return NSLocalizedString(@"turtle", nil);
}

@end
