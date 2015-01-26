//
//  NSArray+RLE.h
//  RubyLikeExtensions
//
//  Created by Konstantin Sukharev on 03/05/14.
//
//


#import "NSArray+RLE.h"


#define RLEEmptyFunction \
^(id _) { return @[]; }


RLEMapFunction cmap(NSArray *collection) {
	if (collection)
		return collection.map;
	else
		return RLEEmptyFunction;
}

RLEFilterFunction cfilter(NSArray *collection) {
	if (collection)
		return collection.filter;
	else
		return RLEEmptyFunction;
}


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

- (RLEMapFunction)map {
	return ^(id(^block)(id)) {
		
		id mapped[self.count];
		NSUInteger i = 0;
		for (id mappable in self) {
			id o = block(mappable);
			if (o) mapped[i++] = o;
		}
		return [NSArray arrayWithObjects:mapped count:i];
	};
}

- (RLEFilterFunction)filter {
	return ^(BOOL(^block)(id)) {
		
		id filtered[self.count];
		NSUInteger i = 0;
		for (id o in self) {
			if (block(o)) filtered[i++] = o;
		}
		return [NSArray arrayWithObjects:filtered count:i];
	};
}

@end
