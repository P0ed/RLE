//
//  NSPredicate+RLE.h
//  MemNow
//
//  Created by Konstantin Sukharev on 09/09/14.
//  Copyright (c) 2014 MemNow. All rights reserved.
//

@import Foundation;


@interface NSPredicate (RLE)

- (NSPredicate *)notPredicate;

@end


@interface NSArray (RLENSPredicate)

- (NSPredicate *)andPredicate;
- (NSPredicate *)orPredicate;

@end
