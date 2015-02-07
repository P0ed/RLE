//
//  NSDate+RLE.m
//  MemNow
//
//  Created by Konstantin Sukharev on 01/09/14.
//  Copyright (c) 2014 MemNow. All rights reserved.
//

#import "NSDate+RLE.h"


@implementation NSDate (RLE)

- (NSString *(^)(NSString *))stringUsingFormat {
	return ^(NSString *format) {
		
		NSDateFormatter *dateFormatter = NSDateFormatter.new;
		dateFormatter.dateFormat = format;
		return [dateFormatter stringFromDate:self];
	};
}

@end
