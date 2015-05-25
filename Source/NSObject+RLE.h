//
//  NSObject+RLE.h
//  MemNow
//
//  Created by Konstantin Sukharev on 04/11/14.
//  Copyright (c) 2014 MemNow. All rights reserved.
//

@import Foundation;


@interface NSObject (RLE)

- mutable;

- (instancetype)onMain;
- (instancetype)onBackground;

@end
