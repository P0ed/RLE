//
//  ReusableProxy.m
//  RLE CLI
//
//  Created by Konstantin Sukharev on 09/12/14.
//  Copyright (c) 2014 Konstantin Sukharev. All rights reserved.
//

#import "ReusableProxy.h"

@implementation ReusableProxy

+ (instancetype)proxyWithTarget:(id)target {
	
	ReusableProxy *proxy = self.alloc;
	proxy.target = target;
	
	return proxy;
}

- (NSMethodSignature *(^)(ReusableProxy *, SEL))methodSignatureForSelectorBlock {
	
	if (!_methodSignatureForSelectorBlock) {
		_methodSignatureForSelectorBlock = ^(ReusableProxy *proxy, SEL sel) {
			
			return [proxy.target methodSignatureForSelector:sel];
		};
	}
	return _methodSignatureForSelectorBlock;
}

- (void (^)(ReusableProxy *, NSInvocation *))forwardInvocationBlock {
	
	if (!_forwardInvocationBlock) {
		_forwardInvocationBlock = ^(ReusableProxy *proxy, NSInvocation *invocation) {
			
			[invocation invokeWithTarget:proxy.target];
		};
	}
	return _forwardInvocationBlock;
}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)sel {
	return self.methodSignatureForSelectorBlock(self, sel);
}

- (void)forwardInvocation:(NSInvocation *)invocation {
	self.forwardInvocationBlock(self, invocation);
}

@end
