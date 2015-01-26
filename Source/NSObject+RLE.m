//
//  NSObject+RLE.m
//  MemNow
//
//  Created by Konstantin Sukharev on 04/11/14.
//  Copyright (c) 2014 MemNow. All rights reserved.
//

#import "NSObject+RLE.h"

@implementation NSObject (RLE)

- mutable {
	
	id mutableObject = nil;
	static NSHashTable *mutableClasses;
	static dispatch_once_t onceToken;
	dispatch_once(&onceToken, ^{
		mutableClasses = [NSHashTable hashTableWithOptions:NSPointerFunctionsWeakMemory];
		[mutableClasses addObject:NSMutableSet.class];
		[mutableClasses addObject:NSMutableDictionary.class];
		[mutableClasses addObject:NSMutableArray.class];
		[mutableClasses addObject:NSHashTable.class];
		[mutableClasses addObject:NSMapTable.class];
		[mutableClasses addObject:NSMutableString.class];
		[mutableClasses addObject:NSMutableAttributedString.class];
	});
	
	if ([self conformsToProtocol:@protocol(NSMutableCopying)]) {
		
		mutableObject = [mutableClasses containsObject:self.class] ? self : self.mutableCopy;
	}
	
	return mutableObject;
}

@end
