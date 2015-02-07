//
//  NSNumber+RLE.h
//  RubyLikeExtensions
//
//  Created by Konstantin Sukharev on 03/05/14.
//
//


@import Foundation;
@import UIKit;


@interface NSNumber (RLE)

- (UIFont *)ptFont;
- (UIFont *)ptMediumFont;
- (UIFont *)ptLightFont;

- (UIColor *)rgbColor;

- (NSNumber *(^)(void (^block)(void)))ifTrue;
- (NSNumber *(^)(void (^block)(void)))ifFalse;

@end


extern void RLESetupFontNamesMap(NSDictionary *fontNamesMap);


typedef NS_ENUM(NSInteger, RLEFontStyle) {
	
	RLEFontStyleLight,
	RLEFontStyleRegular,
	RLEFontStyleMedium
};
