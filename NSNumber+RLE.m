//
//  NSNumber+RLE.m
//  RubyLikeExtensions
//
//  Created by Konstantin Sukharev on 03/05/14.
//
//

#import "NSNumber+RLE.h"

@implementation NSNumber (RLE)

- (UIFont *)ptFont {
	
	return [UIFont fontWithName:@"HelveticaNeue" size:self.integerValue];
}

- (UIFont *)ptMediumFont {
	
	return [UIFont fontWithName:@"HelveticaNeue-Medium" size:self.integerValue];
}

- (UIFont *)ptLightFont {
	
	return [UIFont fontWithName:@"HelveticaNeue-Light" size:self.integerValue];
}

- (UIColor *)rgbColor {
	
    return [UIColor colorWithRed:((self.integerValue & 0xFF0000) >> 16) / 255.0
						   green:((self.integerValue & 0xFF00) >> 8) / 255.0
							blue:(self.integerValue & 0xFF) / 255.0
						   alpha:1];
}

- (UIColor *)rgbaColor {
	
    return [UIColor colorWithRed:((self.integerValue & 0xFF000000) >> 24) / 255.0
						   green:((self.integerValue & 0xFF0000) >> 16) / 255.0
							blue:((self.integerValue & 0xFF00) >> 8) / 255.0
						   alpha:(self.integerValue & 0xFF) / 255.0];
}

- (NSNumber *(^)(void (^)(void)))ifTrue { return ^(void (^block)(void)) {
	
	if (self.boolValue) block();
	return self;
};}

- (NSNumber *(^)(void (^)(void)))ifFalse {
	
	return @(!self.boolValue).ifTrue;
}

@end
