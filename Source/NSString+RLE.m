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

- (NSNumber *)hexValue {
    
    unsigned long long value;
    NSScanner *scanner = [NSScanner scannerWithString:self];
    BOOL scanResult = [scanner scanHexLongLong:&value];
	
	return scanResult ? @(value) : nil;
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

- (NSDate *(^)(NSString *))dateUsingFormat {
	return ^(NSString *format) {
		
		NSDateFormatter *dateFormatter = NSDateFormatter.new;
		dateFormatter.dateFormat = format;
		return [dateFormatter dateFromString:self];
	};
}

- (BOOL (^)(NSString *))grep {
	return ^BOOL(NSString *rx) {
		
		return [self rangeOfString:rx options:NSRegularExpressionSearch].location != NSNotFound;
	};
}

@end
