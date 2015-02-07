//
//  NSNumber+RLE.m
//  RubyLikeExtensions
//
//  Created by Konstantin Sukharev on 03/05/14.
//
//

#import "NSNumber+RLE.h"


static NSDictionary *__fontNamesMap;

void RLESetupFontNamesMap(NSDictionary *fontNamesMap) {
	__fontNamesMap = fontNamesMap;
}


@implementation NSNumber (RLE)

+ (void)load {
	
	RLESetupFontNamesMap(@{
						   @(RLEFontStyleLight):	@"HelveticaNeue-Light",
						   @(RLEFontStyleRegular):	@"HelveticaNeue",
						   @(RLEFontStyleMedium):	@"HelveticaNeue-Medium",
						   });
}

- (UIFont *)ptFont {
	return [UIFont fontWithName:__fontNamesMap[@(RLEFontStyleRegular)] size:self.doubleValue];
}

- (UIFont *)ptMediumFont {
	return [UIFont fontWithName:__fontNamesMap[@(RLEFontStyleMedium)] size:self.doubleValue];
}

- (UIFont *)ptLightFont {
	return [UIFont fontWithName:__fontNamesMap[@(RLEFontStyleLight)] size:self.doubleValue];
}

- (UIColor *)rgbColor {
	
    return [UIColor colorWithRed:((self.integerValue & 0xFF0000) >> 16) / 255.0
						   green:((self.integerValue & 0xFF00) >> 8) / 255.0
							blue:(self.integerValue & 0xFF) / 255.0
						   alpha:1];
}

- (NSNumber *(^)(void (^)(void)))ifTrue {
	return ^(void (^block)(void)) {
	
		if (self.boolValue) block();
		return self;
	};
}

- (NSNumber *(^)(void (^)(void)))ifFalse {
	return @(!self.boolValue).ifTrue;
}

@end
