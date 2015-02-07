//
//  NSPredicate+RLE.m
//  MemNow
//
//  Created by Konstantin Sukharev on 09/09/14.
//  Copyright (c) 2014 MemNow. All rights reserved.
//

#import "NSPredicate+RLE.h"


@implementation NSPredicate (RLE)

- (NSPredicate *)notPredicate {
	return [NSCompoundPredicate notPredicateWithSubpredicate:self];
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
