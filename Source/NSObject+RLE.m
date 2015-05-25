//
//  NSObject+RLE.m
//  MemNow
//
//  Created by Konstantin Sukharev on 04/11/14.
//  Copyright (c) 2014 MemNow. All rights reserved.
//

#import "NSObject+RLE.h"
#import "ReusableProxy.h"

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

- (instancetype)onMain {
	
	ReusableProxy *proxy = [ReusableProxy proxyWithTarget:self];
	proxy.forwardInvocationBlock = ^(ReusableProxy *proxy, NSInvocation *invocation) {
	
		dispatch_block_t invokeBlock = ^{
			[invocation invokeWithTarget:proxy.target];
		};
		
		if (NSThread.isMainThread) {
			invokeBlock();
		} else {
			dispatch_sync(dispatch_get_main_queue(), invokeBlock);
		}
	};
	
	return (id)proxy;
}

- (instancetype)onBackground {
	
	ReusableProxy *proxy = [ReusableProxy proxyWithTarget:self];
	proxy.forwardInvocationBlock = ^(ReusableProxy *proxy, NSInvocation *invocation) {
		
		dispatch_block_t invokeBlock = ^{
			[invocation invokeWithTarget:proxy.target];
		};
		
		if (NSThread.isMainThread) {
			dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);
			dispatch_async(dispatch_get_global_queue(0, 0), ^{
				invokeBlock();
				dispatch_semaphore_signal(semaphore);
			});
			dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
		} else {
			invokeBlock();
		}
	};
	
	return (id)proxy;
}

@end
