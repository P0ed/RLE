//
//  NSAttributedString+RLE.m
//  RubyLikeExtensions
//
//  Created by Konstantin Sukharev on 03/05/14.
//
//


#import "NSAttributedString+RLE.h"


@implementation NSAttributedString (RLE)

- (NSRange)wholeString {	
	return NSMakeRange(0, self.length);
}

@end
