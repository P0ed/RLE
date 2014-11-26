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
	
	return [UIFont fontWithName:BRAND_FONT_REGULAR size:self.integerValue];
}

- (UIFont *)ptMediumFont {
	
	return [UIFont fontWithName:BRAND_FONT_MEDIUM size:self.integerValue];
}

- (UIFont *)ptLightFont {
	
	return [UIFont fontWithName:BRAND_FONT_LIGHT size:self.integerValue];
}

- (UIFont *)ptAltFont {
    
    return [UIFont fontWithName:ALTERNATIVE_FONT_REGULAR size:self.integerValue];
}

- (UIFont *)ptAltLightFont {
	
	return [UIFont fontWithName:ALTERNATIVE_FONT_LIGHT size:self.integerValue];
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

@end
