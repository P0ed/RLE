//
//  NSDate+RLE.h
//  MemNow
//
//  Created by Konstantin Sukharev on 01/09/14.
//  Copyright (c) 2014 MemNow. All rights reserved.
//

@import Foundation;

@interface NSDate (RLE)
@property (nonatomic, readonly) NSString *(^stringUsingFormat)(NSString *format);
@end
