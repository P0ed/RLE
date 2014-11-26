//
//  NSString+RLE.m
//  RubyLikeExtensions
//
//  Created by Konstantin Sukharev on 03/05/14.
//
//


#import "NSString+RLE.h"


@implementation NSString (RLE)

- (NSURL *)URL {
	
	return [NSURL URLWithString:self];
}

- (NSUInteger)hexValue {
    
    unsigned long long value;
	
    NSScanner *scanner = [NSScanner scannerWithString:self];
    [scanner scanHexLongLong:&value];
	
    return (NSUInteger)value;
}

- (NSString *)localized {
	
	return NSLocalizedString(self, nil);
}

- (UIImage *)image {
	
	return [UIImage imageNamed:self];
}

- (NSRange)wholeString {
	
	return NSMakeRange(0, self.length);
}

- (NSAttributedString *)attributedString {
	
	return [[NSAttributedString alloc] initWithString:self];
}

- (NSMutableAttributedString *)mutableAttributedString {
	
	return [[NSMutableAttributedString alloc] initWithString:self];
}

- (NSPredicate *)predicate {
	
	return [NSPredicate predicateWithFormat:self];
}

- (NSSortDescriptor *)ascending {
	
	return [NSSortDescriptor sortDescriptorWithKey:self ascending:YES];
}

- (NSSortDescriptor *)descending {
	
	return [NSSortDescriptor sortDescriptorWithKey:self ascending:NO];
}

- (NSDate *)dateUsingFormat:(NSString *)format {
	
	NSDateFormatter *dateFormatter = [NSDateFormatter new];
	dateFormatter.dateFormat = format;
	return [dateFormatter dateFromString:self];
}

@end
