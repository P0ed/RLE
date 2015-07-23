#import "NSPredicate+RLE.h"
#import "NSArray+RLE.h"
#import <YOLOKit/YOLO.h>


@implementation NSPredicate (RLE)

- (NSPredicate *)notPredicate {
	return [NSCompoundPredicate notPredicateWithSubpredicate:self];
}

@end


@implementation NSString (RLENSPredicate)

- (NSPredicate *)predicate {
	return [NSPredicate predicateWithFormat:self];
}

@end


@implementation NSDictionary (RLENSPredicate)

- (NSPredicate *)predicate {
	return unwrapArray(self.allKeys).map(^(NSString *key) {
		return [NSPredicate predicateWithFormat:@"%K = %@", key, self[key]];
	}).andPredicate;
}

@end


@implementation NSArray (RLENSPredicate)

- (NSPredicate *)andPredicate {
	return [NSCompoundPredicate andPredicateWithSubpredicates:self];
}

- (NSPredicate *)orPredicate {
	return [NSCompoundPredicate orPredicateWithSubpredicates:self];
}

@end
