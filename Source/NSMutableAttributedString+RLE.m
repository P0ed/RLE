//
//  NSMutableAttributedString+RLE.m
//  RubyLikeExtensions
//
//  Created by Konstantin Sukharev on 03/05/14.
//
//


#import "NSMutableAttributedString+RLE.h"
#import "NSAttributedString+RLE.h"


@implementation NSMutableAttributedString (RLE)

- (void)setAttribute:(NSString *)attrName value:(id)value {
	[self addAttribute:attrName value:value range:self.wholeString];
}

- (void)setFont:(UIFont *)font {
	[self setAttribute:NSFontAttributeName value:font];
}

- (void)setTextColor:(UIColor *)textColor {
	[self setAttribute:NSForegroundColorAttributeName value:textColor];
}

- (void)setBackgroundColor:(UIColor *)backgroundColor {
	[self setAttribute:NSBackgroundColorAttributeName value:backgroundColor];
}

- (void)setParagraphStyle:(NSParagraphStyle *)paragraphStyle {
	[self setAttribute:NSParagraphStyleAttributeName value:paragraphStyle];
}

- (void)setAlignment:(NSTextAlignment)alignment {
	
	NSRange limitRange = self.wholeString;
	NSRange effectiveRange;
	
	while (limitRange.length > 0) {
		
		NSParagraphStyle *style = [self attribute:NSParagraphStyleAttributeName atIndex:limitRange.location longestEffectiveRange:&effectiveRange inRange:limitRange];
		limitRange = NSMakeRange(NSMaxRange(effectiveRange), NSMaxRange(limitRange) - NSMaxRange(effectiveRange));
		
		if (!style) style = NSParagraphStyle.defaultParagraphStyle;
		NSMutableParagraphStyle *mutableStyle = style.mutableCopy;
		
		mutableStyle.alignment = alignment;
		[self addAttribute:NSParagraphStyleAttributeName value:mutableStyle range:effectiveRange];
	}
}

@end


@implementation NSAttributedString (RLE_readonly)

- (id)attribute:(NSString *)attrName {
	
	id attribute = nil;
	
	if (self.length) {
		
		NSRange effectiveRange;
		id attributeAtRange = [self attribute:attrName atIndex:0 longestEffectiveRange:&effectiveRange inRange:self.wholeString];
		
		if (NSEqualRanges(effectiveRange, self.wholeString)) {
			
			attribute = attributeAtRange;
		}
	}
	
	return attribute;
}

- (UIFont *)font {
	return [self attribute:NSFontAttributeName];
}

- (UIColor *)textColor {
	return [self attribute:NSForegroundColorAttributeName];
}

- (UIColor *)backgroundColor {
	return [self attribute:NSBackgroundColorAttributeName];
}

- (NSParagraphStyle *)paragraphStyle {
	return [self attribute:NSParagraphStyleAttributeName];
}

- (NSTextAlignment)alignment {
	
	NSParagraphStyle *paragraphStyle = self.paragraphStyle ?: NSParagraphStyle.defaultParagraphStyle;
	return paragraphStyle.alignment;
}

@end
