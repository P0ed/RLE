//
//  NSArray+RLE.h
//  RubyLikeExtensions
//
//  Created by Konstantin Sukharev on 03/05/14.
//
//


#import "NSArray+RLE.h"


@implementation NSArray (RLE)

- (NSIndexPath *)indexPath {
	
	NSUInteger *indexes = (NSUInteger *)malloc(sizeof(NSUInteger) * self.count);
	[self eachWithIndex:^(NSNumber *object, NSUInteger index) {
		
		indexes[index] = object.unsignedIntegerValue;
	}];
	NSIndexPath *indexPath = [NSIndexPath indexPathWithIndexes:indexes length:self.count];
	free(indexes);
	
	return indexPath;
}

- (NSSet *)set {
	
	return [NSSet setWithArray:self];
}

@end
