#import "NSArray+RLE.h"


@implementation NSArray (RLE)

- (NSSet *)set {
	return [NSSet setWithArray:self];
}

- (NSIndexPath *)indexPath {

	NSUInteger indexes[self.count];
	NSUInteger i = 0;
	for (NSNumber *value in self) {

		indexes[i++] = value.unsignedIntegerValue;
	}
	return [NSIndexPath indexPathWithIndexes:indexes length:i];
}

@end
