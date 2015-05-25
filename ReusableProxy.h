//
//  ReusableProxy.h
//  RLE CLI
//
//  Created by Konstantin Sukharev on 09/12/14.
//  Copyright (c) 2014 Konstantin Sukharev. All rights reserved.
//

@import Foundation;

@interface ReusableProxy : NSProxy

@property (nonatomic) id target;
@property (nonatomic, copy) NSMethodSignature *(^methodSignatureForSelectorBlock)(ReusableProxy *proxy, SEL selector);
@property (nonatomic, copy) void (^forwardInvocationBlock)(ReusableProxy *proxy, NSInvocation *invocation);

+ (instancetype)proxyWithTarget:(id)target;

@end
