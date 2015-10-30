#import "NSArray+RLE.h"


@implementation NSArray (RLE)

- (NSArray *)tail {
	return self.count ? [self subarrayWithRange:NSMakeRange(1, self.count - 1)] : @[];
}

- (NSSet *)set {
	return [NSSet setWithArray:self];
}

- (NSOrderedSet *)orderedSet {
	return [NSOrderedSet orderedSetWithArray:self];
}

- (NSIndexPath *)indexPath {

	NSUInteger indexes[self.count];
	NSUInteger i = 0;
	for (NSNumber *value in self) {

		indexes[i++] = value.unsignedIntegerValue;
	}
	return [NSIndexPath indexPathWithIndexes:indexes length:i];
}

- (NSString *)keyPath {
	return [self componentsJoinedByString:@"."];
}

@end
